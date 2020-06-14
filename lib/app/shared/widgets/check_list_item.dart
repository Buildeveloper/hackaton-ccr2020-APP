import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class CheckListItem extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String itemName;

  const CheckListItem({
    Key key,
    this.value = false,
    this.onChanged,
    this.itemName = "",
  }) : super(key: key);

  @override
  _CheckListItemState createState() => _CheckListItemState();
}

class _CheckListItemState extends State<CheckListItem> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CheckboxListTile(
          title: Text("title text"),
          checkColor: AppColors.PRIMARY_COLOR,
          value: widget.value,
          onChanged: widget.onChanged,
          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        ),
      ],
    );
  }
}
