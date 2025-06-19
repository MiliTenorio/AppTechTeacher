import 'dart:async';
import 'package:tech_teacher/features/chat/data/models/chat_message_model.dart';
import 'package:tech_teacher/features/chat/data/datasources/chat_datasource.dart';

class ChatDatasourceImpl implements ChatDatasource {
  @override
  Future<ChatMessageModel> sendMessage(String userInput) async {
    await Future.delayed(const Duration(seconds: 1));

    // Aqui futuramente você vai chamar a API do Gemini de verdade.
    return ChatMessageModel(
      message: 'Simulando GEMINI "$userInput"',
      isUser: false,
    );
  }
}
