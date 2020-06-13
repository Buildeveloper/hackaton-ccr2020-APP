import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/strings.dart' as Strings;
import 'package:ace/app/shared/widgets/default_input_text.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key key,
    @required this.focus,
    @required this.passwordController,
  }) : super(key: key);

  final FocusNode focus;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return DefaultInputText(
      labelText: Strings.PASSWORD,
      focusNode: focus,
      controller: passwordController,
      inputType: TextInputType.text,
      autoFocus: false,
      obscureText: true,
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key key,
    @required this.phoneController,
    @required this.focus,
  }) : super(key: key);

  final TextEditingController phoneController;
  final FocusNode focus;

  @override
  Widget build(BuildContext context) {
    return DefaultInputText(
      labelText: Strings.CELLPHONE,
      controller: phoneController,
      textInputAction: TextInputAction.next,
      autoFocus: false,
      obscureText: false,
      inputType: TextInputType.phone,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(focus);
      },
    );
  }
}
