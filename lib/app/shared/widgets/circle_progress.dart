import 'package:flutter/material.dart';
import 'dart:math';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class CircleProgress extends CustomPainter {
  double currentProgress;
  double strokeWidth;
  Color paintColor;

  CircleProgress(
      {this.currentProgress,
      this.strokeWidth = 10,
      this.paintColor = AppColors.ACCENT_COLOR});

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = strokeWidth
      ..color = AppColors.DEFAULT_GRAY
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = strokeWidth
      ..color = paintColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
