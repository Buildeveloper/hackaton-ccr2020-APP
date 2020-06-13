import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final double _width;
  final double _rectHeight;
  final BuildContext context;

  Painter(this.context, this._width, this._rectHeight);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      new Rect.fromLTRB(0.0, 0.0, this._width, _rectHeight),
      new Paint()..color = Theme.of(context).accentColor,
    );
  }

  @override
  bool shouldRepaint(Painter oldDelegate) {
    return false;
  }
}
