import 'package:tech_teacher/features/chat/data/models/chat_message_model.dart';

abstract class ChatDatasource {
  Future<ChatMessageModel> sendMessage(String userInput);
}
