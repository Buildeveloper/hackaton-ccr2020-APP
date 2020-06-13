import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle textStyle;
  final MainAxisAlignment alignment;

  const ClickableText({
    Key key,
    this.text,
    this.onTap,
    this.textStyle,
    this.alignment = MainAxisAlignment.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: <Widget>[
        InkWell(
          onTap: onTap,
          child: Text(text, style: textStyle),
        ),
      ],
    );
  }
}
