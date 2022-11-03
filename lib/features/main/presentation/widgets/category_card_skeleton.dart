import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/ui_kit/skeleton.dart';
import 'package:farfor_demo/core/ui_kit/widgets/image_skeleton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryCardSkeleton extends StatelessWidget {
  const CategoryCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeleton(
        child: SizedBox(
      width: (MediaQuery.of(context).size.width - 50) / 2,
      child: Card(
        color: AppColors.white,
        shadowColor: AppColors.grey,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, kDebugMode ? 13 : 0, 20, 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSkeleton(
                  width: (MediaQuery.of(context).size.width - 50) / 2.5,
                  height: (MediaQuery.of(context).size.width - 50) / 3.5),
              Container(
                padding: const EdgeInsets.only(top: 8),
                color: AppColors.white,
                width: (MediaQuery.of(context).size.width - 50) / 3,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
