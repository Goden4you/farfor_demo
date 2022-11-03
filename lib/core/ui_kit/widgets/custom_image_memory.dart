import 'dart:typed_data';

import 'package:farfor_demo/core/constants/assets.dart';
import 'package:farfor_demo/core/ui_kit/widgets/image_skeleton.dart';
import 'package:flutter/material.dart';

class CustomImageMemory extends StatelessWidget {
  final Uint8List? imageBytes;
  final double width;
  final double height;
  final BoxFit? fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final Widget? defaultImage;

  const CustomImageMemory(
    this.imageBytes, {
    this.fit = BoxFit.cover,
    this.height = 40,
    this.width = 40,
    this.color,
    this.borderRadius,
    this.defaultImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius ?? BorderRadius.circular(4),
          ),
          child: imageBytes != null
              ? Image.memory(
                  imageBytes!,
                  fit: fit,
                  width: width,
                  height: height,
                  frameBuilder: (BuildContext context, Widget child, int? frame,
                      bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) return child;
                    if (frame == null) {
                      return ImageSkeleton(
                        width: width,
                        height: height,
                        borderRadius: borderRadius,
                      );
                    }
                    return child;
                  },
                )
              : defaultImage ?? Image.asset(AssetsIcons.sadEmoji),
        ));
  }
}
