import 'package:farfor_demo/core/utils/snackbars.dart';
import 'package:flutter/material.dart';

showErrorSnackbar(BuildContext context, {required String? text}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBars.errorSnackBar(context, text));
}
