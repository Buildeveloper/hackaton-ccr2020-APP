import 'package:flutter/material.dart';

class CircleImageView extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;
  final BoxFit fit;
  final bool network;

  CircleImageView(
      this.imagePath, this.width, this.height, this.fit, this.network);

  @override
  _CircleImageViewPageState createState() => new _CircleImageViewPageState();
}

class _CircleImageViewPageState extends State<CircleImageView> {
  @override
  Widget build(BuildContext context) {
    Image image;
    if (widget.network)
      image = Image.network(widget.imagePath);
    else
      image = Image.asset(widget.imagePath);

    return new Container(
        width: widget.width,
        height: widget.height,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(fit: widget.fit, image: image.image)));
  }
}
