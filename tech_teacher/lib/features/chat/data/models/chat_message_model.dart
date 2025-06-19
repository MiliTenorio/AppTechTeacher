import 'package:tech_teacher/features/chat/domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  ChatMessageModel({required super.message, required super.isUser});

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      message: json['text'] as String,
      isUser: json['isUser'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'text': message, 'isUser': isUser};
  }

  factory ChatMessageModel.fromEntity(ChatMessage text) {
    return ChatMessageModel(message: text.message, isUser: text.isUser);
  }

  ChatMessage toEntity() {
    return ChatMessage(message: message, isUser: isUser);
  }
}
