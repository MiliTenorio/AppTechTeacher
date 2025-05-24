import 'package:flutter/material.dart';
import 'package:tech_teacher/core/app_colors.dart';
import 'package:tech_teacher/features/chat/presentation/pages/chat_bubble.dart';
import 'package:tech_teacher/features/chat/presentation/pages/insert_prompt.dart';
import 'package:tech_teacher/features/chat/presentation/stores/chat_store.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final chatStore = ChatStore();

  @override
  Widget build(BuildContext context) {
    final messages = [
      {'text': 'Hello, I´m the TechTeacher', 'isUser': false},
      {'text': 'Hi! I wanna learn Python', 'isUser': true},
    ];

    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('TechTeacher'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (_, index) {
                final message = messages[index];
                return ChatBubble(
                  text: message['text']!.toString(),
                  isUser: message['isUser']!.toString() == "true"
                      ? true
                      : false,
                );
              },
            ),
          ),
          SafeArea(
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: InsertPrompt(
                controller: controller,
                onSend: () {
                  final input = controller.text.trim();
                  if (input.isNotEmpty) {
                    chatStore.sendToGemini(input);
                    controller.clear();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
