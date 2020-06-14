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

  const SignUpInfoPage({Key key, this.title = "SignUpInfo"}) : super(key: key);

  @override
  _SignUpInfoPageState createState() => _SignUpInfoPageState();
}

class _SignUpInfoPageState
    extends ModularState<SignUpInfoPage, SignUpInfoController> {
    bool status = false;
  //use 'controller' variable to access controller

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
              resourceName: Resources.MASCOTE,
            ),
            Divider(
              height: 16,
              color: AppColors.TRANSPARENT,
            ),
            Expanded( flex: 1, child:
              SingleChildScrollView(
                child: Text(
                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
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
