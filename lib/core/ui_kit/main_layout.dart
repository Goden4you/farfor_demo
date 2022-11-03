import 'package:farfor_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool resizeToAvoidBottomInset;
  final Widget body;
  final Widget? bottomNavigationBar;
  const MainLayout({
    Key? key,
    required this.appBar,
    this.resizeToAvoidBottomInset = false,
    required this.body,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        color: AppColors.white,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
