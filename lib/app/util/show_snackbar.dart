import 'package:flutter/material.dart';
import 'package:macos_ui_app/app/widget/snackbar/snackbar.dart';

showSimpleSnackBar({
  required BuildContext context,
  SnackBarType type = SnackBarType.error,
  String? message,
  Duration duration =  const Duration(milliseconds: 4000),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ).copyWith(bottom: 12),
      duration: duration,
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: SnackBarContent(
        type: type,
        message: message,
      ),
    ),
  );
}
