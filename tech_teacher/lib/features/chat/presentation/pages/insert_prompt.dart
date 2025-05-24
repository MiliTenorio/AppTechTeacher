import 'package:flutter/material.dart';
import 'package:tech_teacher/core/app_colors.dart';

class InsertPrompt extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onSend;

  const InsertPrompt({super.key, required this.controller, this.onSend});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: '...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.send),
          color: AppColors.primaryBlue,
          onPressed: onSend,
        ),
      ],
    );
  }
}
