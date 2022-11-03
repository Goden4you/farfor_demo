import 'package:farfor_demo/core/ui_kit/skeleton.dart';
import 'package:flutter/material.dart';

class ImageSkeleton extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  const ImageSkeleton(
      {Key? key, required this.width, required this.height, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeleton(
        child: ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(4),
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    ));
  }
}
