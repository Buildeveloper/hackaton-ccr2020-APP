import 'package:flutter/material.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class PickerItem extends StatelessWidget {
  final String text;
  final int id;
  final bool initialItem;

  const PickerItem({
    Key key,
    this.text,
    this.id,
    this.initialItem = false,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      text,
      style: TextStyle(color: AppColors.LIGHT_TEXT_COLOR, fontSize: 20.0),
    ));
  }

  int getId() => this.id;
}
