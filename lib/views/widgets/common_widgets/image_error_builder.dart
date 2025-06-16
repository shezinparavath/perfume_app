import 'package:flutter/material.dart';
import 'package:perfume_app/contants/constants.dart';

class ImageErrorBuilder extends StatelessWidget {
  const ImageErrorBuilder({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.errorImage, height: height, width: width);
  }
}
