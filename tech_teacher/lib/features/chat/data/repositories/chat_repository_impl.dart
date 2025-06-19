import 'package:tech_teacher/features/chat/domain/entities/chat_message.dart';
import 'package:tech_teacher/features/chat/domain/repositories/chat_repository.dart';
import 'package:tech_teacher/features/chat/data/datasources/chat_datasource.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatDatasource datasource;

  ChatRepositoryImpl(this.datasource);

  @override
  Future<ChatMessage> sendMessage(String userInput) async {
    final result = await datasource.sendMessage(userInput);
    return result.toEntity();
  }
}
