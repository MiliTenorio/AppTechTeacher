import 'package:tech_teacher/features/chat/domain/entities/chat_message.dart';

abstract class ChatRepository {
  Future<ChatMessage> sendMessage(String userInput);
}
