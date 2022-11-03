import 'package:farfor_demo/core/constants/colors.dart';
import 'package:farfor_demo/core/constants/text_styles.dart';
import 'package:farfor_demo/core/utils/hide_keyboard.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool needBackArrow;
  final Function? onBackPressed;
  final Function? onAppBarPressed;
  final String title;
  final List<Widget> actions;
  final bool centerTitle;

  const DefaultAppBar({
    Key? key,
    this.needBackArrow = false,
    this.onBackPressed,
    this.onAppBarPressed,
    required this.title,
    this.actions = const [],
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onAppBarPressed != null
            ? () => onAppBarPressed?.call()
            : () => hideKeyboard(context),
        child: AppBar(
          leading: needBackArrow
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.black,
                  ),
                  onPressed: () {
                    if (onBackPressed != null) {
                      onBackPressed!.call();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                )
              : null,
          title: Padding(
              padding: EdgeInsets.only(left: centerTitle ? 0 : 20),
              child: Text(
                title,
                style: AppTextStyles.bold20pt,
              )),
          centerTitle: centerTitle,
          titleSpacing: 0,
          actions: actions,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          elevation: needBackArrow ? 0 : 1,
          shadowColor: AppColors.border,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
