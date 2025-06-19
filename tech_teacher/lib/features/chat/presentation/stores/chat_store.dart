import 'package:mobx/mobx.dart';
import 'package:tech_teacher/features/chat/domain/entities/chat_message.dart';
import 'package:tech_teacher/features/chat/domain/usecases/send_message_usecase.dart';

part 'chat_store.g.dart';

enum ChatStatus { idle, loading, success, error }

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  final SendMessageUseCase sendMessageUseCase;

  _ChatStoreBase(this.sendMessageUseCase);

  @observable
  ObservableList<ChatMessage> messages = ObservableList<ChatMessage>();

  @observable
  ChatStatus status = ChatStatus.idle;

  @observable
  String? errorMessage;

  @action
  void addUserMessage(String message) {
    messages.add(ChatMessage(message: message, isUser: true));
  }

  @action
  Future<void> sendToGemini(String userInput) async {
    status = ChatStatus.loading;
    errorMessage = null;
    addUserMessage(userInput);

    try {
      final response = await sendMessageUseCase(userInput);
      print("aqui: store reponse $response");
      messages.add(response);
      status = ChatStatus.success;
    } catch (e) {
      errorMessage = 'Error sending message : $e';
      status = ChatStatus.error;
    }
  }

  @action
  void clearMessages() {
    messages.clear();
  }
}
