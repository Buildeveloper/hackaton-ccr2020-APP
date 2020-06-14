// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatbotController on _ChatbotControllerBase, Store {
  final _$messagesAtom = Atom(name: '_ChatbotControllerBase.messages');

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

  final _$_ChatbotControllerBaseActionController =
      ActionController(name: '_ChatbotControllerBase');

  @override
  dynamic addMessage(ChatMessage message) {
    final _$actionInfo = _$_ChatbotControllerBaseActionController.startAction(
        name: '_ChatbotControllerBase.addMessage');
    try {
      return super.addMessage(message);
    } finally {
      _$_ChatbotControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages}
    ''';
  }
}
