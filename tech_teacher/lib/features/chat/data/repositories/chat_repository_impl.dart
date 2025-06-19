import 'package:tech_teacher/features/chat/data/datasources/chat_datasource.dart';
import 'package:tech_teacher/features/chat/data/models/chat_message_model.dart';
import 'package:tech_teacher/features/chat/domain/entities/chat_message.dart';
import 'package:tech_teacher/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDatasource datasource;

  ChatRepositoryImpl(this.datasource);

  @override
  Future<ChatMessage> sendMessage(String userInput) async {
    /*final result = await datasource.sendMessage(userInput);
    return result.toEntity();*/
    final ChatMessageModel chat = await datasource.sendMessage(userInput);
    print("aqui: chat repository impl ${chat.message}");
    return ChatMessage(message: chat.message, isUser: chat.isUser);
  }
}
