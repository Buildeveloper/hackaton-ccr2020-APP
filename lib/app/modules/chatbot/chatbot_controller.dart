import 'package:ace/app/modules/chatbot/models/chat_message.dart';
import 'package:mobx/mobx.dart';

part 'chatbot_controller.g.dart';

class ChatbotController = _ChatbotControllerBase with _$ChatbotController;

abstract class _ChatbotControllerBase with Store {
  @observable
  ObservableList<ChatMessage> messages = ObservableList<ChatMessage>.of([]);

  @action
  addMessage(ChatMessage message) {
    this.messages.add(message);
  }
}
