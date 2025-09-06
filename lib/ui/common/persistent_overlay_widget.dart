import 'package:lottie/lottie.dart';
import 'package:wonders/common_libs.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wonders/logic/api_keys.dart';
import 'dart:io';

class PersistentOverlayWidget extends StatefulWidget {
  const PersistentOverlayWidget({super.key});

  @override
  State<PersistentOverlayWidget> createState() => _PersistentOverlayWidgetState();
}

class _PersistentOverlayWidgetState extends State<PersistentOverlayWidget> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _messages = <ChatMessage>[];
  late final _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  late final _scaleAnimation = Tween<double>(begin: 1.0, end: 0.0)
      .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

  // AI-related variables
  late final GenerativeModel _model;
  late AnimationController _dotAnimationController;
  late List<Animation<double>> _dotAnimations;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-2.5-flash-lite',
      apiKey: ApiKeys.geminiApi,
      generationConfig: GenerationConfig(maxOutputTokens: 2048, temperature: 0.7),
    );

    _dotAnimationController = AnimationController(duration: const Duration(milliseconds: 1800), vsync: this)..repeat();

    _dotAnimations = List.generate(3, (index) {
      final beginTime = index * 0.2;
      return TweenSequence<double>([
        TweenSequenceItem(
            tween: Tween<double>(begin: 0.5, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
        TweenSequenceItem(
            tween: Tween<double>(begin: 1.0, end: 0.5).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
      ]).animate(CurvedAnimation(
          parent: _dotAnimationController, curve: Interval(beginTime, beginTime + 0.6, curve: Curves.linear)));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_messages.isEmpty) {
      _messages.add(ChatMessage($strings.chatWelcomeMessage, false, DateTime.now()));
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _animationController.dispose();
    _dotAnimationController.dispose();
    super.dispose();
  }

  Future<bool> _requestImagePermissions() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;
      if (sdkInt >= 33) {
        return (await Permission.photos.request()).isGranted;
      } else {
        return (await Permission.storage.request()).isGranted;
      }
    } else {
      return (await Permission.photos.request()).isGranted;
    }
  }

  void _showChat() {
    _animationController.forward();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => WhatsAppChatScreen(
        initialMessages: List.from(_messages),
        textController: _textController,
        model: _model,
        dotAnimations: _dotAnimations,
        onMessagesUpdated: (messages) => setState(() => _messages
          ..clear()
          ..addAll(messages)),
        onRequestImagePermissions: _requestImagePermissions,
      ),
    ).then((_) => _animationController.reverse());
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _showChat,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.1,
          child: ScaleTransition(scale: _scaleAnimation, child: Lottie.asset(Animations.siri)),
        ),
      );
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final File? imageFile;
  final String id; // Unique identifier for stable animations

  ChatMessage(this.text, this.isUser, this.timestamp, {this.imageFile})
      : id = '${DateTime.now().millisecondsSinceEpoch}_${text.hashCode}';
}

class WhatsAppChatScreen extends StatefulWidget {
  final List<ChatMessage> initialMessages;
  final TextEditingController textController;
  final GenerativeModel model;
  final List<Animation<double>> dotAnimations;
  final Function(List<ChatMessage>) onMessagesUpdated;
  final Future<bool> Function() onRequestImagePermissions;

  const WhatsAppChatScreen({
    super.key,
    required this.initialMessages,
    required this.textController,
    required this.model,
    required this.dotAnimations,
    required this.onMessagesUpdated,
    required this.onRequestImagePermissions,
  });

  @override
  State<WhatsAppChatScreen> createState() => _WhatsAppChatScreenState();
}

class _WhatsAppChatScreenState extends State<WhatsAppChatScreen> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late List<ChatMessage> _messages;
  bool _isLoading = false;
  File? _imageFile;
  bool _showImagePreview = false;

  // Animation controllers for individual messages
  final Map<String, AnimationController> _messageAnimations = {};
  final Map<String, Animation<Offset>> _slideAnimations = {};
  final Map<String, Animation<double>> _fadeAnimations = {};

  @override
  void initState() {
    super.initState();
    _messages = List.from(widget.initialMessages);

    // Initialize animations for existing messages
    for (final message in _messages) {
      _initializeMessageAnimation(message);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _initializeMessageAnimation(ChatMessage message) {
    if (!_messageAnimations.containsKey(message.id)) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      );

      _messageAnimations[message.id] = controller;
      _slideAnimations[message.id] = Tween<Offset>(
        begin: Offset(message.isUser ? 0.3 : -0.3, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

      _fadeAnimations[message.id] = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
      controller.forward();
    }
  }

  void _updateParentMessages() {
    widget.onMessagesUpdated(_messages);
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
          );
        }
      });
    }
  }

  Future<void> _pickImage() async {
    try {
      final hasPermission = await widget.onRequestImagePermissions();
      if (hasPermission) {
        final result =
            await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false, allowCompression: false);
        if (result?.files.isNotEmpty == true && result!.files.single.path != null) {
          setState(() {
            _imageFile = File(result.files.single.path!);
            _showImagePreview = true;
          });
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text($strings.chatPermissionRequired)));
          await openAppSettings();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${$strings.chatErrorPickingImage}: $e')));
      }
    }
  }

  Future<void> _sendMessage() async {
    final messageText = widget.textController.text.trim();
    if (messageText.isEmpty && _imageFile == null) return;

    widget.textController.clear();

    // Add user messages with animations
    final List<ChatMessage> newMessages = [];
    if (messageText.isNotEmpty) {
      newMessages.add(ChatMessage(messageText, true, DateTime.now()));
    }
    if (_imageFile != null) {
      newMessages.add(ChatMessage($strings.chatImageUploaded, true, DateTime.now(), imageFile: _imageFile));
    }

    setState(() {
      for (final message in newMessages) {
        _messages.add(message);
        _initializeMessageAnimation(message);
      }
      _isLoading = true;
      _showImagePreview = false;
    });

    _updateParentMessages();
    _scrollToBottom();

    try {
      final chatSession = widget.model.startChat();
      List<Part> parts = [];

      if (messageText.isNotEmpty) parts.add(TextPart(messageText));
      if (_imageFile != null) {
        try {
          final imageBytes = await _imageFile!.readAsBytes();
          parts.add(DataPart('image/jpeg', imageBytes));
        } catch (e) {
          if (mounted) {
            final errorMessage = ChatMessage('${$strings.chatErrorProcessingImage}: $e', false, DateTime.now());
            setState(() {
              _messages.add(errorMessage);
              _initializeMessageAnimation(errorMessage);
              _isLoading = false;
              _imageFile = null;
            });
            _updateParentMessages();
            _scrollToBottom();
          }
          return;
        }
      }

      final response = await chatSession.sendMessage(Content.multi(parts));

      if (mounted) {
        final responseMessage = ChatMessage(response.text ?? $strings.chatNoResponse, false, DateTime.now());
        setState(() {
          _messages.add(responseMessage);
          _initializeMessageAnimation(responseMessage);
          _isLoading = false;
          _imageFile = null;
        });
        _updateParentMessages();
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        final errorMessage = ChatMessage('${$strings.chatErrorProcessingRequest}: $e', false, DateTime.now());
        setState(() {
          _messages.add(errorMessage);
          _initializeMessageAnimation(errorMessage);
          _isLoading = false;
        });
        _updateParentMessages();
        _scrollToBottom();
      }
    }
  }

  String _time(DateTime t) => "${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}";

  Widget _buildImagePreview() {
    if (_imageFile == null || !_showImagePreview) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(_imageFile!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.broken_image, size: 40))),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text($strings.chatImageReady, style: const TextStyle(color: Colors.white70))),
        IconButton(
            icon: const Icon(Icons.close, color: Colors.redAccent), onPressed: () => setState(() => _imageFile = null)),
      ]),
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
    final slideAnimation = _slideAnimations[message.id];
    final fadeAnimation = _fadeAnimations[message.id];

    if (slideAnimation == null || fadeAnimation == null) {
      _initializeMessageAnimation(message);
      return const SizedBox.shrink(); // Return empty while animations initialize
    }

    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: AnimatedBuilder(
        animation: Listenable.merge([slideAnimation, fadeAnimation]),
        builder: (context, child) => SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
              decoration: BoxDecoration(
                color: message.isUser ? const Color(0xFF005C4B) : const Color(0xFF202C3B),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (message.imageFile != null) ...[
                    Container(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(message.imageFile!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                                height: 100,
                                color: Colors.grey.shade800,
                                child: const Center(child: Icon(Icons.broken_image, size: 40, color: Colors.grey)))),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  MarkdownWidget(
                    data: message.text,
                    shrinkWrap: true,
                    config: MarkdownConfig(configs: [
                      CodeConfig(
                          style: TextStyle(
                              backgroundColor: Colors.grey.shade800, fontFamily: 'monospace', color: Colors.white)),
                      PConfig(textStyle: const TextStyle(color: Colors.white)),
                      H1Config(style: const TextStyle(color: Colors.white)),
                      H2Config(style: const TextStyle(color: Colors.white)),
                      H3Config(style: const TextStyle(color: Colors.white)),
                      LinkConfig(style: const TextStyle(color: Colors.lightBlue)),
                    ]),
                  ),
                  const SizedBox(height: 4),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(_time(message.timestamp), style: TextStyle(color: Colors.grey[400], fontSize: 11)),
                    if (message.isUser) ...[
                      const SizedBox(width: 4),
                      const Icon(Icons.done_all, color: Color(0xFF4FC3F7), size: 14)
                    ],
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color(0xFF202C3B),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            _buildDot(0),
            const SizedBox(width: 4),
            _buildDot(1),
            const SizedBox(width: 4),
            _buildDot(2),
          ]),
        ),
      );

  Widget _buildDot(int index) => AnimatedBuilder(
        animation: widget.dotAnimations[index],
        builder: (context, child) => Transform.scale(
          scale: widget.dotAnimations[index].value,
          child: Opacity(
            opacity: widget.dotAnimations[index].value,
            child: Container(
                width: 8,
                height: 8,
                decoration:
                    const BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.all(Radius.circular(4)))),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration:
          const BoxDecoration(color: Color(0xFF0B1426), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Padding(
          padding: EdgeInsets.only(bottom: keyboardHeight),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                  color: Color(0xFF202C3B), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              child: Row(children: [
                CircleAvatar(backgroundColor: Colors.grey, child: Lottie.asset('assets/animations/siri.json')),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text($strings.chatAssistantName,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  Text($strings.chatAssistantStatus, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                ])),
                IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
              ]),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _messages.isEmpty
                  ? Center(child: Text($strings.chatStartConversation, style: const TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: _messages.length + (_isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < _messages.length) {
                          return _buildMessageItem(_messages[index]);
                        } else {
                          return _buildLoadingIndicator();
                        }
                      },
                    ),
            )),
            _buildImagePreview(),
            Container(
                padding: const EdgeInsets.all(8),
                color: const Color(0xFF202C3B),
                child: Row(children: [
                  Container(
                      decoration: const BoxDecoration(color: Color(0xFF0B1426), shape: BoxShape.circle),
                      child: IconButton(icon: const Icon(Icons.image, color: Colors.teal), onPressed: _pickImage)),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(color: const Color(0xFF0B1426), borderRadius: BorderRadius.circular(25)),
                    child: TextField(
                        controller: widget.textController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: $strings.chatTypeMessage,
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                        onSubmitted: (_) => _sendMessage()),
                  )),
                  const SizedBox(width: 8),
                  Container(
                      decoration: const BoxDecoration(color: Color(0xFF00A884), shape: BoxShape.circle),
                      child: IconButton(icon: const Icon(Icons.send, color: Colors.white), onPressed: _sendMessage)),
                ])),
          ])),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
