import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class DefaultInputText extends StatelessWidget {
  final String labelText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool autoFocus;
  final bool obscureText;
  final TextInputAction textInputAction;
  final Function(String) onFieldSubmitted;
  final int maxLength;
  final VoidCallback onTap;
  final bool enabled;
  final bool readOnly;
  final bool staticBottom;
  final bool hint;
  final Function(String) onChanged;

  const DefaultInputText({
    Key key,
    this.labelText,
    this.focusNode,
    this.controller,
    this.inputType,
    this.autoFocus = false,
    this.obscureText = false,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxLength,
    this.onTap,
    this.enabled,
    this.readOnly = false,
    this.staticBottom = false,
    this.hint = false,
    this.onChanged,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: readOnly,
        enabled: enabled,
        onTap: onTap,
        focusNode: focusNode,
        controller: controller,
        keyboardType: inputType,
        autofocus: autoFocus,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        maxLength: maxLength,
        style: _getStyle(),
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: _getDecoration(context));
  }

  TextStyle _getStyle() {
    if (hint) {
      return TextStyle(color: AppColors.HINT_TEXT_COLOR, fontSize: 20);
    }

    return TextStyle(color: AppColors.PRIMARY_COLOR, fontSize: 20);
  }

  InputDecoration _getDecoration(BuildContext context) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: staticBottom
              ? BorderSide(color: AppColors.PRIMARY_COLOR)
              : BorderSide(color: AppColors.PRIMARY_COLOR),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.WHITE),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppColors.PRIMARY_COLOR,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ));
  }
}
