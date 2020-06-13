import 'package:flutter/material.dart';

class DefaultImageView extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String resourceName;

  const DefaultImageView({
    Key key,
    this.height = 200,
    this.width = 1000,
    this.color,
    this.resourceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Image(
        color: color,
        image: AssetImage(resourceName),
      ),
    );
  }
}
