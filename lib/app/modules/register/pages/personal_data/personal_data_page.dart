import 'package:ace/app/modules/register/pages/personal_data/personal_data_controller.dart';
import 'package:ace/app/shared/constants/strings.dart' as Strings;
import 'package:ace/app/shared/constants/routes.dart' as Routes;
import 'package:ace/app/shared/constants/colors.dart' as AppColors;
import 'package:ace/app/shared/widgets/default_button.dart';
import 'package:ace/app/shared/widgets/default_input_text.dart';
import 'package:ace/app/shared/widgets/keyboard_dismiss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PersonalDataPage extends StatefulWidget {
  final String title;

  const PersonalDataPage({Key key, this.title = "PersonalData"})
      : super(key: key);

  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState
    extends ModularState<PersonalDataPage, PersonalDataController> {
  final nameFocus = FocusNode();
  final secondNameFocus = FocusNode();
  final cellphoneFocus = FocusNode();
  final emailFocus = FocusNode();
  final birthDateFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();
  final nameTextController = TextEditingController();
  final secondNameTextController = TextEditingController();
  final cellphoneTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final birthDateTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  double divider = 40;

  @override
  void dispose() {
    nameFocus.dispose();
    secondNameFocus.dispose();
    cellphoneFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    nameTextController.dispose();
    secondNameTextController.dispose();
    cellphoneTextController.dispose();
    emailTextController.dispose();
    birthDateTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    if (passwordTextController.text != confirmPasswordTextController.text)
      controller.setProceedEnabled(false);

    if (nameTextController.text.isEmpty &&
        secondNameTextController.text.isEmpty &&
        cellphoneTextController.text.isEmpty &&
        emailTextController.text.isEmpty &&
        birthDateTextController.text.isEmpty &&
        passwordTextController.text.isEmpty &&
        confirmPasswordTextController.text.isEmpty) {
      controller.setProceedEnabled(false);
    } else {
      controller.setProceedEnabled(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismiss(child: Scaffold(
      bottomNavigationBar: Observer(
        builder: (_) {
          return DefaultButton(
            padding: EdgeInsets.all(15),
            text: Strings.PROCEED,
            enabled: controller.proceedEnabled,
            onPressed: (){
              Modular.to.pushNamed(Routes.HEALTH_DATA);
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              DefaultInputText(
                labelText: "Nome",
                textInputAction: TextInputAction.next,
                controller: nameTextController,
                focusNode: nameFocus,
                onFieldSubmitted: (v) =>
                    FocusScope.of(context).requestFocus(secondNameFocus),
                onChanged: (text) {
                  _validateFields();
                },
              ),
              Divider(color: AppColors.TRANSPARENT, height: divider,),
              DefaultInputText(
                labelText: "Sobrenome",
                textInputAction: TextInputAction.next,
                controller: secondNameTextController,
                focusNode: secondNameFocus,
                onFieldSubmitted: (v) =>
                    FocusScope.of(context).requestFocus(cellphoneFocus),
                onChanged: (text) {
                  _validateFields();
                },
              ),
              Divider(color: AppColors.TRANSPARENT, height: divider,),
              DefaultInputText(
                labelText: "Celular",
                textInputAction: TextInputAction.next,
                controller: cellphoneTextController,
                focusNode: cellphoneFocus,
                onFieldSubmitted: (v) =>
                    FocusScope.of(context).requestFocus(emailFocus),
                onChanged: (text) {
                  _validateFields();
                },
              ),
              Divider(color: AppColors.TRANSPARENT, height: divider,),
              DefaultInputText(
                labelText: "Email",
                textInputAction: TextInputAction.next,
                controller: emailTextController,
                focusNode: emailFocus,
                onFieldSubmitted: (v) =>
                    FocusScope.of(context).requestFocus(birthDateFocus),
                onChanged: (text) {
                  _validateFields();
                },
              ),
              Divider(color: AppColors.TRANSPARENT, height: divider,),
              DefaultInputText(
                labelText: "Data de nascimento",
                textInputAction: TextInputAction.next,
                controller: birthDateTextController,
                focusNode: birthDateFocus,
                onFieldSubmitted: (v) =>
                    FocusScope.of(context).requestFocus(passwordFocus),
                onChanged: (text) {
                  _validateFields();
                },
              ),
              Divider(color: AppColors.TRANSPARENT, height: divider,),
              DefaultInputText(
                labelText: "Senha",
                obscureText: true,
                textInputAction: TextInputAction.next,
                controller: passwordTextController,
                focusNode: passwordFocus,
                onFieldSubmitted: (v) =>
                    FocusScope.of(context).requestFocus(confirmPasswordFocus),
                onChanged: (text) {
                  _validateFields();
                },
              ),
              Divider(color: AppColors.TRANSPARENT, height: divider,),
              DefaultInputText(
                labelText: "Confirmar senha",
                obscureText: true,
                controller: confirmPasswordTextController,
                focusNode: confirmPasswordFocus,
                onChanged: (text) {
                  _validateFields();
                },
              ),
            ],
          ),
        ),
      ),
    ),);
  }
}
