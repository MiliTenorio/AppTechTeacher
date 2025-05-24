import 'package:mobx/mobx.dart';

import '../../../chat/domain/entities/chat_message.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  @observable
  ObservableList<ChatMessage> messages = ObservableList<ChatMessage>();

  @observable
  bool isLoading = false;

  @action
  void addUserMessage(String message) {
    messages.add(ChatMessage(message: message, isUser: true));
  }

  @action
  Future<void> sendToGemini(String userInput) async {
    isLoading = true;

    addUserMessage(userInput);

    // 🔮 Aqui futuramente entra chamada à API do Gemini
    await Future.delayed(
      const Duration(seconds: 1),
    ); // Simula delay da resposta

    messages.add(
      ChatMessage(
        message: 'Resposta simulada do Gemini para "$userInput"',
        isUser: false,
      ),
    );

    isLoading = false;
  }

  @action
  void clearMessages() {
    messages.clear();
  }
}
