import 'package:cached_network_image/cached_network_image.dart';
import 'package:farfor_demo/core/constants/assets.dart';
import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/ui_kit/widgets/image_skeleton.dart';
import 'package:flutter/material.dart';

class CustomImageNetwork extends StatelessWidget {
  final String src;
  final double width;
  final double height;
  final BoxFit? fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final Widget? defaultImage;
  final BoxConstraints? boxConstraints;
  final GlobalKey? cartKey;

  const CustomImageNetwork(
    this.src, {
    this.fit = BoxFit.cover,
    this.height = 40,
    this.width = 40,
    this.color,
    this.borderRadius,
    this.defaultImage,
    this.boxConstraints,
    this.cartKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        key: cartKey,
        height: boxConstraints != null ? null : height,
        width: boxConstraints != null ? null : width,
        constraints: boxConstraints,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
        child: ClipRRect(
          borderRadius: borderRadius ??
              BorderRadius.circular(boxConstraints != null ? 0 : 4),
          child: CachedNetworkImage(
            imageUrl: src,
            // cacheKey: src,
            fit: fit,
            width: boxConstraints != null ? null : width,
            height: boxConstraints != null ? null : height,
            fadeOutDuration: Duration.zero,
            fadeInDuration: Duration.zero,
            placeholder: (context, _) {
              if (boxConstraints != null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                    strokeWidth: 3,
                  ),
                );
              }

              // return ImageSkeleton(
              //   width: width,
              //   height: height,
              //   borderRadius: borderRadius,
              // ); // оставляю, но не вписывается в дизайн

              return const Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.red,
                      strokeWidth: 3,
                    ),
                  ));
            },
            errorWidget: (context, _, __) {
              return defaultImage ?? Image.asset(AssetsIcons.sadEmoji);
            },
          ),
        ));
  }
}
