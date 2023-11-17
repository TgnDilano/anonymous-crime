import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos_ui_app/app/extensions/number_ext.dart';

enum SnackBarType {
  error,
  sucess,
}

class SnackBarContent extends StatelessWidget {
  const SnackBarContent({
    super.key,
    this.type = SnackBarType.error,
    this.message,
  });

  final SnackBarType type;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 75,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: getColor(context),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 0.8,
              color: getBorderColor(),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getIcon(),
              12.width,
              Expanded(
                child: Text(
                  message ?? "An error occured while performing operation",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 13,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color getColor(BuildContext context) {
    if (type == SnackBarType.sucess) {
      return context.isDarkMode
          ? const Color.fromARGB(255, 16, 53, 17).withOpacity(0.95)
          : const Color.fromARGB(255, 246, 255, 246);
    }
    return context.isDarkMode
        ? const Color.fromARGB(255, 48, 18, 14).withOpacity(0.95)
        : const Color.fromARGB(255, 255, 249, 249);
  }

  getBorderColor() {
    if (type == SnackBarType.sucess) {
      return Colors.green;
    }

    return Colors.red;
  }

  Widget getIcon() {
    if (type == SnackBarType.sucess) {
      return Icon(
        Icons.check_circle,
        color: getBorderColor(),
        size: 32,
      );
    }

    return Icon(
      Icons.warning_rounded,
      color: getBorderColor(),
      size: 32,
    );
  }
}
