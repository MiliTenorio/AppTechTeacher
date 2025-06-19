import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tech_teacher/core/app_colors.dart';
import 'package:tech_teacher/features/chat/presentation/pages/chat_bubble.dart';
import 'package:tech_teacher/features/chat/presentation/pages/insert_prompt.dart';
import 'package:tech_teacher/features/chat/presentation/stores/chat_store.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = context.read<ChatStore>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('TechTeacher'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: Observer(
        builder: (_) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: store.messages.length,
                itemBuilder: (_, index) {
                  final message = store.messages[index];
                  return ChatBubble(
                    text: message.message,
                    isUser: message.isUser,
                  );
                },
              ),
            ),
            if (store.status == ChatStatus.loading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
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
                      store.sendToGemini(input);
                      controller.clear();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}