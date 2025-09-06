import 'package:lottie/lottie.dart';
import 'package:wonders/common_libs.dart';

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

  @override
  void dispose() {
    _textController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    setState(() => _messages.add(ChatMessage(text, true, DateTime.now())));
    _textController.clear();
    Future.delayed(
        const Duration(seconds: 1),
        () => setState(
            () => _messages.add(ChatMessage('Thanks for your message! How can I help you?', false, DateTime.now()))));
  }

  void _showChat() {
    _animationController.forward();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          duration: const Duration(minutes: 5),
          padding: EdgeInsets.zero,
          content: WhatsAppChatScreen(_messages, _textController, _sendMessage),
        ))
        .closed
        .then((_) => _animationController.reverse());
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _showChat,
        child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
            child: ScaleTransition(scale: _scaleAnimation, child: Lottie.asset(Animations.siri))),
      );
}

class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime timestamp;
  ChatMessage(this.text, this.isMe, this.timestamp);
}

class WhatsAppChatScreen extends StatelessWidget {
  final List<ChatMessage> messages;
  final TextEditingController textController;
  final VoidCallback onSendMessage;
  const WhatsAppChatScreen(this.messages, this.textController, this.onSendMessage, {super.key});

  String _time(DateTime t) => "${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
            color: Color(0xFF0B1426), borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
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
                const Text('Assistant',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Online', style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              ])),
              IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
            ]),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: messages.isEmpty
                ? const Center(child: Text('Start a conversation', style: TextStyle(color: Colors.grey)))
                : ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, i) {
                      final msg = messages[i];
                      return Align(
                        alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                          decoration: BoxDecoration(
                              color: msg.isMe ? const Color(0xFF005C4B) : const Color(0xFF202C3B),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                            Text(msg.text, style: const TextStyle(color: Colors.white)),
                            const SizedBox(height: 4),
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(_time(msg.timestamp), style: TextStyle(color: Colors.grey[400], fontSize: 11)),
                              if (msg.isMe) ...[
                                const SizedBox(width: 4),
                                const Icon(Icons.done_all, color: Color(0xFF4FC3F7), size: 14)
                              ],
                            ]),
                          ]),
                        ),
                      );
                    }),
          )),
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0xFF202C3B),
            child: Row(children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(color: const Color(0xFF0B1426), borderRadius: BorderRadius.circular(25)),
                child: TextField(
                  controller: textController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Type a message',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                  onSubmitted: (_) => onSendMessage(),
                ),
              )),
              const SizedBox(width: 8),
              Container(
                  decoration: const BoxDecoration(color: Color(0xFF00A884), shape: BoxShape.circle),
                  child: IconButton(icon: const Icon(Icons.send, color: Colors.white), onPressed: onSendMessage)),
            ]),
          ),
        ]),
      );
}
