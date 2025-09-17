import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final TTSService _instance = TTSService._internal();
  factory TTSService() => _instance;
  TTSService._internal();

  late FlutterTts _flutterTts;
  bool _isInitialized = false;
  bool _isSpeaking = false;
  String _lastSpokenInstruction = '';

  /// Initialize the TTS service
  Future<void> initialize() async {
    if (_isInitialized) return;

    _flutterTts = FlutterTts();

    try {
      // Configure TTS settings
      await _flutterTts.setLanguage('en-US');
      await _flutterTts.setPitch(1.0);
      await _flutterTts.setSpeechRate(0.5); // Slightly slower for navigation
      await _flutterTts.setVolume(0.8);

      // Set up completion handler
      _flutterTts.setCompletionHandler(() {
        _isSpeaking = false;
      });

      // Set up error handler
      _flutterTts.setErrorHandler((message) {
        print('TTS Error: $message');
        _isSpeaking = false;
      });

      _isInitialized = true;
    } catch (e) {
      print('Failed to initialize TTS: $e');
    }
  }

  /// Speak navigation instruction
  Future<void> speakInstruction(String instruction) async {
    if (!_isInitialized) {
      await initialize();
    }

    // Don't repeat the same instruction
    if (instruction == _lastSpokenInstruction) {
      return;
    }

    try {
      // Stop current speech if any
      if (_isSpeaking) {
        await _flutterTts.stop();
      }

      // Clean the instruction text for better speech
      String cleanInstruction = _cleanInstructionForSpeech(instruction);

      _isSpeaking = true;
      _lastSpokenInstruction = instruction;

      await _flutterTts.speak(cleanInstruction);
    } catch (e) {
      print('Failed to speak instruction: $e');
      _isSpeaking = false;
    }
  }

  /// Speak arrival notification
  Future<void> speakArrival(String destination) async {
    await speakInstruction('You have arrived at $destination');
  }

  /// Speak distance and time information
  Future<void> speakDistanceUpdate(String distance, String time) async {
    await speakInstruction('In $distance, arriving in $time');
  }

  /// Stop current speech
  Future<void> stop() async {
    if (_isInitialized && _isSpeaking) {
      await _flutterTts.stop();
      _isSpeaking = false;
    }
  }

  /// Clean instruction text for better speech synthesis
  String _cleanInstructionForSpeech(String instruction) {
    // Remove HTML tags if any
    String cleaned = instruction.replaceAll(RegExp(r'<[^>]*>'), '');

    // Replace common abbreviations with full words
    cleaned = cleaned
        .replaceAll('St.', 'Street')
        .replaceAll('Ave.', 'Avenue')
        .replaceAll('Rd.', 'Road')
        .replaceAll('Blvd.', 'Boulevard')
        .replaceAll('Dr.', 'Drive')
        .replaceAll('Ct.', 'Court')
        .replaceAll('Pl.', 'Place')
        .replaceAll('Ln.', 'Lane')
        .replaceAll('Hwy.', 'Highway')
        .replaceAll('Pkwy.', 'Parkway');

    // Replace navigation-specific terms
    cleaned = cleaned
        .replaceAll('km', 'kilometers')
        .replaceAll('mi', 'miles')
        .replaceAll('m ', 'meters ')
        .replaceAll('ft', 'feet');

    return cleaned;
  }

  /// Check if TTS is currently speaking
  bool get isSpeaking => _isSpeaking;

  /// Check if TTS is initialized
  bool get isInitialized => _isInitialized;

  /// Dispose resources
  Future<void> dispose() async {
    if (_isInitialized) {
      await _flutterTts.stop();
      _isInitialized = false;
      _isSpeaking = false;
      _lastSpokenInstruction = '';
    }
  }
}
