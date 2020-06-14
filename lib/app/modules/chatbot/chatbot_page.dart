import 'package:ace/app/modules/chatbot/chatbot_controller.dart';
import 'package:ace/app/modules/chatbot/models/chat_message.dart';
import 'package:ace/app/shared/widgets/circle_imageview.dart';
import 'package:ace/app/shared/widgets/default_input_text.dart';
import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;
import 'package:ace/app/shared/constants/resources.dart' as Resources;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class ChatbotPage extends StatefulWidget {
  final String title;

  const ChatbotPage({Key key, this.title = "Assistente"}) : super(key: key);

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends ModularState<ChatbotPage, ChatbotController> {
  final messageTextController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  int index = 0;
  final messages = [
    ChatMessage(message: "Olá, como posso te ajudar?", botMessage: true),
    ChatMessage(
        message: "Que pena! De 1 a 10, qual é o nível da sua dor?",
        botMessage: true),
    ChatMessage(
        message:
            "Nessa intensidade eu recomendo que você realize os alongamentos disponíveis no seu perfil, caso a dor aumente, recomendo que você procure um especialista",
        botMessage: true),
    ChatMessage(
        message: "Não tem de quer! Sempre que precisar conte com o Ace!",
        botMessage: true),
  ];

  @override
  void initState() {
    autorun((_) {
      controller.addMessage(messages[index]);
      index++;
    }, delay: 700);
  }

  @override
  void dispose() {
    messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 100,
//          color: AppColors.ACCENT_COLOR,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: DefaultInputText(
                    controller: messageTextController,
                    labelText: "Mensagem",
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FloatingActionButton(
                    onPressed: () {
                      if (messageTextController.text.length > 0) {
                        controller.addMessage(ChatMessage(
                          message: messageTextController.text,
                          botMessage: false,
                        ));
                        messageTextController.clear();
                        autorun((_) {
                          _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut);
                          autorun((_) {
                            controller.addMessage(messages[index]);
                            index++;
                            autorun((_) {
                              _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOut);
                            }, delay: 200);
                          }, delay: 800);
                        }, delay: 200);
                      }
                    },
                    heroTag: 2,
                    child: Icon(
                      Icons.send,
                      color: AppColors.WHITE,
                    ),
                  ),
                )
              ],
            ),
          )),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            controller: _scrollController,
            itemCount: controller.messages.length,
            itemBuilder: (context, index) {
              final message = controller.messages[index];
              return message.botMessage
                  ? _buildBotMessage(message)
                  : _buildUserMessage(message);
            });
      }),
    );
  }

  Widget _buildUserMessage(ChatMessage message) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            color: AppColors.TRANSPARENT,
          ),
        ),
        Expanded(
          flex: 8,
          child: Card(
            color: AppColors.PRIMARY_COLOR,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(70.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Você",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.WHITE),
                  ),
                  Text(
                    message.message,
                    style: TextStyle(color: AppColors.WHITE),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBotMessage(ChatMessage message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleImageView(
              imagePath: Resources.ACE,
              width: 30,
              height: 30,
              fit: BoxFit.fill,
              stokeWidth: 0,
              network: false,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Card(
                color: AppColors.ACCENT_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70.0),
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Ace",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(message.message),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.TRANSPARENT,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
