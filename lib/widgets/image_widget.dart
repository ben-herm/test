import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final image;

  const CustomImageWidget({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //getting screen size
    var size = MediaQuery.of(context).size;

    //calculating container width
    double imageHeight;
    double imageWidth;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      imageHeight = (size.width * 0.20);
      imageWidth = (size.width * 0.20);
    } else {
      imageHeight = (size.height * 0.10);
      imageWidth = (size.width * 0.10);
    }

    return Image.asset(
      image,
      fit: BoxFit.contain,
      // height: imageHeight,
      // width: imageWidth,
    );
  }
}
