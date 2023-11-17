import 'package:anonymous/app/constants/styles.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  toScreen(Widget screen) async {
    return await Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }

  Color get primaryColor {
    return Theme.of(this).colorScheme.primary;
  }

  Color get secondaryColor {
    return Theme.of(this).colorScheme.secondary;
  }

  bool get isDarkMode {
    final brightness = Theme.of(this).brightness;
    return brightness == Brightness.dark;
  }

  BoxDecoration get boxDecoration {
    return BoxDecoration(
      border: Border.all(
        width: 0.8,
        color: isDarkMode ? Colors.transparent : Colors.black.withOpacity(0.08),
      ),
      color: Theme.of(this).cardColor,
      borderRadius: kBorderRadius,
    );
  }
}
