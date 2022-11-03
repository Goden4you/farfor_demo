import 'package:flutter/material.dart';

hideKeyboard(BuildContext context) {
  final currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
