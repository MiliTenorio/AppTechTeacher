import 'package:tech_teacher/features/chat/domain/entities/chat_message.dart';
import 'package:tech_teacher/features/chat/domain/repositories/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  Future<ChatMessage> call(String userInput) {
    return repository.sendMessage(userInput);
  }
}
