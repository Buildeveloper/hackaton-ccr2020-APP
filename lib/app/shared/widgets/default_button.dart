import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final bool enabled;
  final Color customColor;
  final Color customTextColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  const DefaultButton({
    Key key,
    this.text,
    this.height = 40.0,
    this.onPressed,
    this.enabled = true,
    this.customColor = AppColors.PRIMARY_COLOR,
    this.customTextColor = AppColors.WHITE,
    this.padding,
    this.backgroundColor
  }) : super();

  @override
  Widget build(BuildContext context) {
    var pd = EdgeInsets.all(0.0);
    if (padding != null) pd = padding;

    return Container(
      color: backgroundColor,
      child: Padding(
        padding: pd,
        child: ButtonTheme(
          height: height,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0)),
            onPressed: () {
              if (enabled) onPressed();
            },
            color: enabled ? customColor : AppColors.DISABLED_BUTTON_COLOR,
            child: Text(
              text,
              style: TextStyle(
                  color: customTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
