// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:manual_speech_to_text/manual_speech_to_text.dart';
import 'package:wonders/common_libs.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:wonders/logic/api_keys.dart';
import 'package:wonders/ui/common/chat_screen.dart';

enum SpeakingState { speaking, paused, stopped }

enum ListeningState { idle, starting, listening, stopping }

class PersistentOverlayWidget extends StatefulWidget {
  const PersistentOverlayWidget({super.key});
  @override
  State<PersistentOverlayWidget> createState() => _PersistentOverlayWidgetState();
}

class _PersistentOverlayWidgetState extends State<PersistentOverlayWidget> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _messages = <ChatMessage>[];
  late final _tapController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  late final _longPressController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  late final GenerativeModel _model;
  late AnimationController _dotAnimationController;
  late List<Animation<double>> _dotAnimations;
  ManualSttController? _speechController;
  FlutterTts? _flutterTts;
  SpeechToText? _speechToText;
  Timer? _speechTimeoutTimer;
  String _recognizedText = '';
  String _finalRecognizedText = '';
  bool _isLongPressing = false;
  bool _isInitialized = false;
  ListeningState _listeningState = ListeningState.idle;
  List<dynamic> _availableTtsLanguages = [];
  List<LocaleName> _availableSttLocales = [];
  String _selectedLanguage = 'en-US';
  String _selectedTtsLanguage = 'en-US';
  bool _languagesInitialized = false;
  SpeakingState _speakingState = SpeakingState.stopped;
  bool get _isListening => _listeningState == ListeningState.listening;
  bool get _canStartListening => _listeningState == ListeningState.idle;
  bool get _isBusyWithSpeech => _listeningState != ListeningState.idle;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
        model: 'gemini-2.5-flash-lite',
        apiKey: ApiKeys.geminiApi,
        generationConfig: GenerationConfig(maxOutputTokens: 2048, temperature: 0.7));
    _dotAnimationController = AnimationController(duration: const Duration(milliseconds: 1800), vsync: this)..repeat();
    _dotAnimations = List.generate(
        3,
        (index) => TweenSequence<double>([
              TweenSequenceItem(
                  tween: Tween<double>(begin: 0.5, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
              TweenSequenceItem(
                  tween: Tween<double>(begin: 1.0, end: 0.5).chain(CurveTween(curve: Curves.easeInOut)), weight: 50)
            ]).animate(CurvedAnimation(
                parent: _dotAnimationController,
                curve: Interval(index * 0.2, index * 0.2 + 0.6, curve: Curves.linear))));
    _initializeSpeechComponents();
  }

  Future<void> _initializeSpeechComponents() async {
    try {
      await _initSpeech();
      await _initTts();
      await _initSpeechToTextForLocales();
      if (mounted) setState(() => _isInitialized = true);
    } catch (e) {
      debugPrint('Failed to initialize speech components: $e');
      if (mounted) setState(() => _isInitialized = true);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_messages.isEmpty) _messages.add(ChatMessage('Welcome message', false, DateTime.now()));
    if (_languagesInitialized) {
      String deviceLanguage = Localizations.localeOf(context).toString().replaceAll('_', '-');
      if (_isLanguageSupported(deviceLanguage) && _selectedLanguage != deviceLanguage) _changeLanguage(deviceLanguage);
    }
  }

  @override
  void dispose() {
    _cleanupSpeechResources();
    _tapController.dispose();
    _longPressController.dispose();
    _dotAnimationController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _cleanupSpeechResources() {
    try {
      _speechTimeoutTimer?.cancel();
      _speechTimeoutTimer = null;
      if (_speechController != null) {
        _speechController!.stopStt();
        _speechController!.dispose();
      }
      if (_speechToText != null) _speechToText!.stop();
      _listeningState = ListeningState.idle;
    } catch (e) {
      debugPrint('Error during cleanup: $e');
    }
  }

  Future<void> _initSpeech() async {
    try {
      _speechController = ManualSttController(context);
      _speechController!.listen(onListeningStateChanged: (state) {
        debugPrint('Speech state changed: $state');
        if (mounted) {
          setState(() {
            switch (state) {
              case ManualSttState.listening:
                if (_listeningState == ListeningState.starting) {
                  _listeningState = ListeningState.listening;
                }
                break;
              case ManualSttState.stopped:
                if (_listeningState == ListeningState.stopping) {
                  _listeningState = ListeningState.idle;
                }
                break;
              default:
                break;
            }
          });
        }
      }, onListeningTextChanged: (recognizedText) {
        if (mounted && _isListening) {
          setState(() {
            _recognizedText = recognizedText;
            _finalRecognizedText = recognizedText;
          });
          _resetTimeoutTimer();
        }
      });
      _speechController!.clearTextOnStart = true;
      _speechController!.localId = _selectedLanguage;
      _speechController!.enableHapticFeedback = true;
      _speechController!.pauseIfMuteFor = const Duration(seconds: 30);
      _speechController!.handlePermanentlyDeniedPermission(() {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Microphone permission is required for voice input',
                  style: $styles.text.body.copyWith(color: $styles.colors.white)),
              backgroundColor: $styles.colors.greyStrong));
        }
      });
    } catch (e) {
      debugPrint('Failed to initialize speech controller: $e');
    }
  }

  void _startListening() {
    debugPrint('_startListening called, current state: $_listeningState, canStart: $_canStartListening');
    if (_speechController == null || !_canStartListening) {
      debugPrint('Cannot start listening: controller=${_speechController != null}, canStart=$_canStartListening');
      return;
    }
    try {
      setState(() {
        _listeningState = ListeningState.starting;
        _recognizedText = '';
        _finalRecognizedText = '';
      });
      _speechController!.startStt();
      _resetTimeoutTimer();
      debugPrint('Speech recognition started');
    } catch (e) {
      debugPrint('Error starting speech recognition: $e');
      if (mounted) setState(() => _listeningState = ListeningState.idle);
    }
  }

  void _stopListening() {
    debugPrint('_stopListening called, current state: $_listeningState');
    if (_listeningState == ListeningState.idle) {
      debugPrint('Already idle, nothing to stop');
      return;
    }
    _speechTimeoutTimer?.cancel();
    _speechTimeoutTimer = null;
    if (mounted) setState(() => _listeningState = ListeningState.stopping);
    if (_speechController != null) {
      try {
        _speechController!.stopStt();
        debugPrint('Speech recognition stopped');
      } catch (e) {
        debugPrint('Error stopping speech recognition: $e');
        if (mounted) setState(() => _listeningState = ListeningState.idle);
      }
    } else {
      if (mounted) setState(() => _listeningState = ListeningState.idle);
    }
  }

  void _resetTimeoutTimer() {
    _speechTimeoutTimer?.cancel();
    _speechTimeoutTimer = Timer(const Duration(seconds: 60), () {
      debugPrint('Speech timeout reached');
      if (_isListening) _stopListening();
    });
  }

  Future<void> _initSpeechToTextForLocales() async {
    try {
      _speechToText = SpeechToText();
      bool available = await _speechToText!.initialize();
      if (available) {
        _availableSttLocales = await _speechToText!.locales();
        if (mounted) setState(() => _languagesInitialized = true);
        await _setDefaultLanguage();
      } else {
        if (mounted) setState(() => _languagesInitialized = true);
      }
    } catch (e) {
      debugPrint('Failed to initialize speech to text: $e');
      if (mounted) setState(() => _languagesInitialized = true);
    }
  }

  Future<void> _initTts() async {
    try {
      _flutterTts = FlutterTts();
      _availableTtsLanguages = await _flutterTts!.getLanguages ?? [];
      await _setDefaultTtsLanguage();
      await _flutterTts!.setVolume(1.0);
      await _flutterTts!.setSpeechRate(0.5);
      await _flutterTts!.setPitch(1.0);
      await _flutterTts!.setLanguage(_selectedTtsLanguage);
      _flutterTts!.setCompletionHandler(() {
        if (mounted) setState(() => _speakingState = SpeakingState.stopped);
      });
    } catch (e) {
      debugPrint('Failed to initialize TTS: $e');
      _selectedTtsLanguage = 'en-US';
    }
  }

  Future<void> _setDefaultLanguage() async {
    String deviceLanguage = Localizations.localeOf(context).toString().replaceAll('_', '-');
    String sttLocaleId = deviceLanguage.replaceAll('-', '_');
    LocaleName? matchingLocale = _availableSttLocales
        .cast<LocaleName?>()
        .firstWhere((locale) => locale?.localeId == sttLocaleId, orElse: () => null);
    if (matchingLocale != null) {
      _selectedLanguage = deviceLanguage;
    } else {
      List<String> fallbackPriority = ['en_US', 'en_GB', 'en_AU', 'en_CA'];
      for (String fallback in fallbackPriority) {
        LocaleName? fallbackLocale = _availableSttLocales
            .cast<LocaleName?>()
            .firstWhere((locale) => locale?.localeId == fallback, orElse: () => null);
        if (fallbackLocale != null) {
          _selectedLanguage = fallback.replaceAll('_', '-');
          break;
        }
      }
      if (_selectedLanguage == deviceLanguage && _availableSttLocales.isNotEmpty) {
        _selectedLanguage = _availableSttLocales.first.localeId.replaceAll('_', '-');
      }
    }
    _speechController?.localId = _selectedLanguage;
  }

  Future<void> _setDefaultTtsLanguage() async {
    String deviceLanguage = Localizations.localeOf(context).toString().replaceAll('_', '-');
    if (_availableTtsLanguages.contains(deviceLanguage)) {
      _selectedTtsLanguage = deviceLanguage;
    } else if (_availableTtsLanguages.contains('en-US')) {
      _selectedTtsLanguage = 'en-US';
    } else if (_availableTtsLanguages.contains('en_US')) {
      _selectedTtsLanguage = 'en_US';
    } else if (_availableTtsLanguages.isNotEmpty) {
      _selectedTtsLanguage = _availableTtsLanguages.first.toString();
    }
  }

  bool _isLanguageSupported(String languageCode) {
    String sttLocaleId = languageCode.replaceAll('-', '_');
    return _availableSttLocales.any((locale) => locale.localeId == sttLocaleId);
  }

  Future<void> _changeLanguage(String newLanguage) async {
    if (mounted) {
      setState(() {
        _selectedLanguage = newLanguage;
        _selectedTtsLanguage = newLanguage;
      });
    }
    _speechController?.localId = newLanguage;
    try {
      await _flutterTts?.setLanguage(newLanguage);
    } catch (e) {
      String altFormat =
          newLanguage.contains('-') ? newLanguage.replaceAll('-', '_') : newLanguage.replaceAll('_', '-');
      try {
        await _flutterTts?.setLanguage(altFormat);
        _selectedTtsLanguage = altFormat;
      } catch (e2) {
        debugPrint('Error setting TTS language: $e2');
      }
    }
  }

  void _showLanguageSelector() {
    if (!_languagesInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('Languages are still loading...', style: $styles.text.body.copyWith(color: $styles.colors.white)),
          backgroundColor: $styles.colors.greyStrong));
      return;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
                backgroundColor: $styles.colors.offWhite,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular($styles.corners.md)),
                title: Text('Select Language', style: $styles.text.h3.copyWith(color: $styles.colors.greyStrong)),
                content: SizedBox(
                    width: double.maxFinite,
                    height: 300,
                    child: ListView.builder(
                        itemCount: _availableSttLocales.length,
                        itemBuilder: (context, index) {
                          final locale = _availableSttLocales[index];
                          final languageCode = locale.localeId.replaceAll('_', '-');
                          final isSelected = languageCode == _selectedLanguage;
                          final displayName = _getLanguageDisplayName(locale);
                          return Container(
                              margin: EdgeInsets.symmetric(vertical: $styles.insets.xxs),
                              decoration: BoxDecoration(
                                  color: isSelected ? $styles.colors.accent1.withOpacity(0.1) : Colors.transparent,
                                  borderRadius: BorderRadius.circular($styles.corners.sm)),
                              child: ListTile(
                                  title: Text(displayName,
                                      style: $styles.text.bodyBold
                                          .copyWith(color: isSelected ? $styles.colors.accent1 : $styles.colors.body)),
                                  subtitle: Text(locale.localeId,
                                      style: $styles.text.bodySmall.copyWith(color: $styles.colors.caption)),
                                  trailing: isSelected
                                      ? Icon(Icons.check_circle, color: $styles.colors.accent1)
                                      : Icon(Icons.radio_button_unchecked, color: $styles.colors.greyMedium),
                                  onTap: () {
                                    _changeLanguage(languageCode);
                                    Navigator.of(context).pop();
                                  }));
                        })),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: TextButton.styleFrom(
                          foregroundColor: $styles.colors.accent1,
                          backgroundColor: $styles.colors.accent1.withOpacity(0.1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular($styles.corners.sm))),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: $styles.insets.sm,
                            vertical: $styles.insets.xs,
                          ),
                          child: Text('Cancel', style: $styles.text.btn.copyWith(color: $styles.colors.accent1))))
                ]));
  }

  String _getLanguageDisplayName(LocaleName locale) {
    if (locale.name.isNotEmpty) return locale.name;
    return locale.localeId;
  }

  Future<void> _speak(String text) async {
    if (text.isNotEmpty && _flutterTts != null) {
      try {
        if (mounted) setState(() => _speakingState = SpeakingState.speaking);
        await _flutterTts!.speak(text);
      } catch (exception) {
        if (mounted) setState(() => _speakingState = SpeakingState.stopped);
        debugPrint('TTS Error: $exception');
      }
    }
  }

  Future<void> _sendSpeechMessage() async {
    if (_finalRecognizedText.isEmpty) return;
    final userMessage = ChatMessage(_finalRecognizedText, true, DateTime.now());
    if (mounted) setState(() => _messages.add(userMessage));
    try {
      final chatSession = _model.startChat();
      final response = await chatSession.sendMessage(Content.text(_finalRecognizedText));
      final aiMessage = ChatMessage(response.text ?? 'Sorry, I could not understand that.', false, DateTime.now());
      if (mounted) setState(() => _messages.add(aiMessage));
      if (aiMessage.text.isNotEmpty) await _speak(aiMessage.text);
    } catch (e) {
      final errorMessage = ChatMessage('Sorry, there was an error processing your request.', false, DateTime.now());
      if (mounted) setState(() => _messages.add(errorMessage));
      await _speak('Sorry, there was an error processing your request.');
    }
  }

  Future<void> _stopSpeaking() async {
    if (_speakingState == SpeakingState.speaking && _flutterTts != null) {
      try {
        await _flutterTts!.stop();
        if (mounted) setState(() => _speakingState = SpeakingState.stopped);
      } catch (e) {
        debugPrint('Error stopping TTS: $e');
      }
    }
  }

  void _showChat() {
    if (_isBusyWithSpeech) return;
    _tapController.forward().then((value) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: $styles.insets.md, vertical: $styles.insets.sm),
                  child: ElevatedButton.icon(
                      onPressed: _showLanguageSelector,
                      icon: Icon(Icons.language, color: $styles.colors.white),
                      label: Text('Language: ${_getLanguageDisplayNameFromCode(_selectedLanguage)}'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: $styles.colors.accent1,
                          foregroundColor: $styles.colors.white,
                          elevation: 4.0,
                          padding: EdgeInsets.symmetric(horizontal: $styles.insets.md, vertical: $styles.insets.sm),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular($styles.corners.lg))))),
              WhatsAppChatScreen(
                  initialMessages: List.from(_messages),
                  textController: _textController,
                  model: _model,
                  dotAnimations: _dotAnimations,
                  onMessagesUpdated: (messages) {
                    if (mounted) {
                      setState(() => _messages
                        ..clear()
                        ..addAll(messages));
                    }
                  })
            ])).then((_) => _tapController.reverse()));
  }

  String _getLanguageDisplayNameFromCode(String languageCode) {
    String localeId = languageCode.replaceAll('-', '_');
    LocaleName? matchingLocale = _availableSttLocales
        .cast<LocaleName?>()
        .firstWhere((locale) => locale?.localeId == localeId, orElse: () => null);
    if (matchingLocale != null) return _getLanguageDisplayName(matchingLocale);
    return languageCode;
  }

  Offset _getTranslation() {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return Offset.zero;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);
    final screenSize = MediaQuery.of(context).size;
    return Offset(
        screenSize.width / 2 - position.dx - size.width / 2, screenSize.height / 2 - position.dy - size.height / 2);
  }

  void _handleLongPressStart() {
    debugPrint('Long press started');
    if (mounted) setState(() => _isLongPressing = true);
    _longPressController.forward();
    _startListening();
  }

  void _handleLongPressEnd() async {
    debugPrint('Long press ended');
    if (mounted) setState(() => _isLongPressing = false);
    _longPressController.reverse();
    _stopListening();
    await Future.delayed(const Duration(milliseconds: 800));
    if (_finalRecognizedText.isNotEmpty && _listeningState == ListeningState.idle) await _sendSpeechMessage();
  }

  void _handleLongPressCancel() {
    debugPrint('Long press cancelled');
    if (mounted) setState(() => _isLongPressing = false);

    _longPressController.reverse();
    _stopListening();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {
        debugPrint('Tap detected - speaking: ${_speakingState == SpeakingState.speaking}, busy: $_isBusyWithSpeech');
        if (_speakingState == SpeakingState.speaking) {
          _stopSpeaking();
        } else if (_isBusyWithSpeech) {
          _stopListening();
        } else {
          _showChat();
        }
      },
      onDoubleTap: () {
        if (_languagesInitialized) _showLanguageSelector();
      },
      onLongPressStart: (_) => _handleLongPressStart(),
      onLongPressEnd: (_) => _handleLongPressEnd(),
      onLongPressCancel: () => _handleLongPressCancel(),
      child: Stack(clipBehavior: Clip.none, children: [
        AnimatedBuilder(
            animation: Listenable.merge([_tapController, _longPressController]),
            builder: (context, child) {
              final longPressValue = _longPressController.value;
              final tapScale = Tween<double>(begin: 1.0, end: 0.0).transform(_tapController.value);
              return Transform.translate(
                  offset: _getTranslation() * longPressValue,
                  child: Transform.scale(
                      scale: tapScale * (1.0 + longPressValue * 1.5),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: _isLongPressing || _isListening
                                  ? [
                                      BoxShadow(
                                          color: $styles.colors.accent1.withOpacity(0.4),
                                          blurRadius: $styles.insets.md,
                                          spreadRadius: $styles.insets.xs)
                                    ]
                                  : null),
                          child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.13,
                              child: Lottie.asset('assets/animations/siri.json')))));
            })
      ]));
}
