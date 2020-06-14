import 'package:ace/app/modules/chatbot/chatbot_controller.dart';
import 'package:ace/app/modules/chatbot/chatbot_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatbotModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatbotController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ChatbotPage()),
      ];

  static Inject get to => Inject<ChatbotModule>.of();
}
