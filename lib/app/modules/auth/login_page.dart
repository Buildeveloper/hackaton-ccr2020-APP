import 'package:ace/app/modules/auth/login_controller.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;
import 'package:ace/app/shared/widgets/clickable_text.dart';
import 'package:ace/app/shared/widgets/default_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ace/app/shared/constants/routes.dart' as Routes;
import 'package:ace/app/shared/constants/strings.dart' as Strings;
import 'package:ace/app/shared/constants/resources.dart' as Resources;
import 'package:ace/app/shared/widgets/default_button.dart';
import 'package:ace/app/shared/widgets/keyboard_dismiss.dart';
import 'components/login_widgets.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final phoneTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final focus = FocusNode();

  void login() {
//    controller.login(
//        context, phoneTextController.text, passwordTextController.text);
    proceedToMenu();
  }

  @override
  void proceedToMenu() {
    Modular.to.pushReplacementNamed(Routes.HOME);
  }

  @override
  void dispose() {
    focus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismiss(
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Center(
              child: SingleChildScrollView(
                  child: new Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DefaultImageView(
                        resourceName: Resources.LOGO,
                      ),
                      Divider(color: Colors.transparent, height: 50),
                      PhoneTextField(
                          phoneController: phoneTextController, focus: focus),
                      Divider(
                        color: AppColors.TRANSPARENT,
                      ),
                      PasswordTextField(
                          focus: focus,
                          passwordController: passwordTextController),
                      Divider(
                        color: AppColors.TRANSPARENT,
                        height: 20,
                      ),
                      DefaultButton(
                        text: Strings.LOG_IN,
                        onPressed: login,
                      ),
                      Divider(
                        height: 5,
                      ),
                      DefaultButton(
                        text: "Quero fazer parte",
                        onPressed: () =>
                            Modular.to.pushNamed(Routes.PERSONAL_DATA),
                        customColor: AppColors.ACCENT_COLOR,
                        customTextColor: AppColors.PRIMARY_COLOR,
                      ),
                    ],
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
