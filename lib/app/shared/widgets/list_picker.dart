import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;
import 'package:ace/app/shared/widgets/picker_tem.dart';

class ListPicker extends StatefulWidget {
  final String title;
  final String btnTitle;
  final double heightPicker;
  final String pickerTitle;
  final double itemExtent;
  final bool disableButton;
  final ValueChanged<int> onSelectedItemChanged;
  final List<Widget> choices;
  final int chosen;
  final String placeholder;

  ListPicker({
    @required this.btnTitle,
    @required this.pickerTitle,
    @required this.onSelectedItemChanged,
    @required this.choices,
    this.chosen = -1,
    this.disableButton = false,
    this.heightPicker = 270.0,
    this.itemExtent = 50.0,
    this.title,
    this.placeholder,
  });

  @override
  _ListPickerState createState() => _ListPickerState();
}

class _ListPickerState extends State<ListPicker> {
  Widget chosenItem;
  Widget selectedItem;

  @override
  void initState() {
    if (widget.chosen >= 0) {
      chosenItem = widget.choices[widget.chosen];
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget hint = _content(widget.btnTitle, widget.placeholder, widget.choices);

    var contains = widget.choices.contains(chosenItem);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _title(widget.title),
        ButtonTheme(
          height: 43.0,
          child: _body(contains, hint),
        ),
      ],
    );
  }

  Widget _content(String btnTitle, String placeholder, List<Widget> choices) {
    if (choices.length > 0) {
      return Text(
        widget.btnTitle,
        style: TextStyle(color: Colors.grey, fontSize: 20.0),
      );
    }

    return Text(
      widget.placeholder,
      style: TextStyle(color: Colors.grey, fontSize: 20.0),
    );
  }

  Widget _body(bool contains, Widget hint) {
    return InkWell(
      onTap: widget.disableButton
          ? null
          : () {
              if (widget.choices.length > 0) {
                selectedItem = widget.choices[0];
                showModalBottomSheet<int>(
                  context: context,
                  builder: (BuildContext context) {
                    return _statePicker();
                  },
                );
              }
            },
      child: new Container(
        height: 30,
        decoration: new BoxDecoration(
            //color: AppColors.LIGHT_TEXT_COLOR,
            border: Border(
                bottom:
                    BorderSide(width: 1.0, color: AppColors.PRIMARY_COLOR))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FittedBox(
              child: _selectedItem(contains, hint)
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.PRIMARY_COLOR,
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectedItem(bool contains, Widget hint) {
    final item = chosenItem as PickerItem;
    if (contains) {
      if (item.initialItem) {
        return Text(
          item.text,
          style: TextStyle(color: Colors.grey, fontSize: 20.0),
        );
      } else return chosenItem;
    }

    return hint;
  }

  Widget _title(String title) {
    if (title != null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
        child: Text(
          widget.title,
          style: TextStyle(color: AppColors.PRIMARY_COLOR, fontSize: 15),
        ),
      );
    }

    return null;
  }

  Widget _statePicker() {
    return Container(
      height: widget.heightPicker,
      color: AppColors.PRIMARY_COLOR,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.PRIMARY_COLOR),
          title: Center(
            child: Text(
              widget.pickerTitle,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.PRIMARY_COLOR),
            ),
          ),
          backgroundColor: AppColors.PRIMARY_COLOR,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              color: AppColors.PRIMARY_COLOR,
              onPressed: () {
                setState(() {
                  chosenItem = selectedItem;
                  widget.onSelectedItemChanged(
                      widget.choices.indexOf(chosenItem));
                });
                Modular.to.pop();
              },
            ),
          ],
        ),
        body: Container(
          decoration: _backgroundGradient(),
          child: CupertinoPicker(
            squeeze: 1.0,
            magnification: 1.0,
            backgroundColor: Colors.transparent,
            itemExtent: widget.itemExtent,
            looping: false,
            onSelectedItemChanged: (index) {
              selectedItem = widget.choices[index];
            },
            children: widget.choices,
          ),
        ),
      ),
    );
  }

  BoxDecoration _backgroundGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.PRIMARY_COLOR,
          AppColors.PRIMARY_COLOR,
        ],
      ),
    );
  }
}
