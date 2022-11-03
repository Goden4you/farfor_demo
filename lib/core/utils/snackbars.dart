import 'package:farfor_demo/core/constants/assets.dart';
import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/constants/text_styles.dart';
import 'package:farfor_demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SnackBars {
  static errorSnackBar(BuildContext context, String? text) => SnackBar(
        content: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SvgPicture.asset(
                AssetsIcons.warningWithoutBorderWhite,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: RichText(
                  maxLines: 3,
                  text: TextSpan(
                    text: text ?? S.of(context).error,
                    style: AppTextStyles.regular16pt
                        .copyWith(color: AppColors.white),
                  )),
            ),
            const Spacer(),
            IconButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.close,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.red,
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.only(left: 8),
      );
}
