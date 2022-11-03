import 'package:farfor_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

@immutable
class Skeleton extends StatelessWidget {
  final Widget child;

  const Skeleton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.highlightColor,
      highlightColor: AppColors.white,
      child: child,
    );
  }
}
