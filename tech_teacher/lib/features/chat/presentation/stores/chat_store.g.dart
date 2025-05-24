// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on _ChatStoreBase, Store {
  late final _$messagesAtom =
      Atom(name: '_ChatStoreBase.messages', context: context);

  @override
  ObservableList<ChatMessage> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<ChatMessage> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ChatStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$sendToGeminiAsyncAction =
      AsyncAction('_ChatStoreBase.sendToGemini', context: context);

  @override
  Future<void> sendToGemini(String userInput) {
    return _$sendToGeminiAsyncAction.run(() => super.sendToGemini(userInput));
  }

  late final _$_ChatStoreBaseActionController =
      ActionController(name: '_ChatStoreBase', context: context);

  @override
  void addUserMessage(String message) {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.addUserMessage');
    try {
      return super.addUserMessage(message);
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearMessages() {
    final _$actionInfo = _$_ChatStoreBaseActionController.startAction(
        name: '_ChatStoreBase.clearMessages');
    try {
      return super.clearMessages();
    } finally {
      _$_ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages},
isLoading: ${isLoading}
    ''';
  }
}
