import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sign_up_info_controller.dart';
import 'package:ace/app/shared/constants/strings.dart' as Strings;
import 'package:ace/app/shared/widgets/default_button.dart';
import 'package:ace/app/shared/widgets/default_image_view.dart';
import 'package:ace/app/shared/constants/resources.dart' as Resources;
import 'package:ace/app/shared/constants/colors.dart' as AppColors;
import 'package:ace/app/shared/constants/routes.dart' as Routes;

class SignUpInfoPage extends StatefulWidget {
  final String title;

  const SignUpInfoPage({Key key, this.title = "Bem-vindo"}) : super(key: key);

  @override
  _SignUpInfoPageState createState() => _SignUpInfoPageState();
}

class _SignUpInfoPageState
    extends ModularState<SignUpInfoPage, SignUpInfoController> {
    bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultButton(
        padding: EdgeInsets.all(15),
        text: Strings.PROCEED,
        onPressed: (){
            Modular.to.pushNamed(Routes.PERSONAL_DATA);
        }
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Divider(
              height: 32,
              color: AppColors.TRANSPARENT,
            ),
            DefaultImageView(
              resourceName: Resources.ACE,
            ),
            Divider(
              height: 16,
              color: AppColors.TRANSPARENT,
            ),
            Expanded( flex: 1, child:
              SingleChildScrollView(
                child: Text(
                  "Mas o que é o ACE?! Ace é um aplicativo que através de gamefication auxilia e acompanha o caminhoneiro em sua mudança para uma vida mais saudável. Contando com um sistema de comunidade, o Ace incentiva o engajamento entre os caminhoneiros e a ajuda mutua. Existem diversas formas de ganhar pontos no Ace, seja interagindo com a comunidade, consumindo algum podcast ou conteúdo relacionado a doença do nosso usuário ou também Toda vez que o usuário faz uma ação que pode impactar positivamente sua saúde, como por exemplo fazer exercício, tomar seus medicamentos em dia, se hidratar,  acompanhar sua pressão e controle de calorias ingeridas. O ace ainda conta com um chatbot integrado que ajuda o usuário a resolver dúvidas. Por exemplo estou com uma dor em braço, o chatbot então indicaria alongamentos e exercícios, ou até um encaminhamento para um médico parceiro.",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
