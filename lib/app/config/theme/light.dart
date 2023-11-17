import 'package:flutter/material.dart';
import 'package:macos_ui_app/app/constants/colors.dart';

const defaultFontSize = 16.0;
const double lineHeight = 1.2;

class LightThemeData {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.kPrimary,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "SharpGrotesk",
    cardColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimary,
      secondary: AppColors.kBlackGray,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey.shade300,
      thickness: 0.6,
    ),
    checkboxTheme: const CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: BorderSide(
        width: 0.8,
      ),
      /* fillColor: MaterialStatePropertyAll(
        AppColors.kSecondary,
      ), */
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: "SharpGrotesk",
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0.5,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: lineHeight,
      ),
      titleMedium: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        height: lineHeight,
      ),
      titleSmall: const TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        height: lineHeight,
      ),
      bodyLarge: const TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: lineHeight,
      ),
      bodyMedium: const TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        height: lineHeight,
      ),
      bodySmall: const TextStyle(
        fontSize: defaultFontSize - 1,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        height: lineHeight,
      ),
      displayLarge: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.kGrey,
        height: lineHeight,
      ),
      displayMedium: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.kGrey,
        height: lineHeight,
      ),
      displaySmall: TextStyle(
        fontSize: defaultFontSize - 1,
        fontWeight: FontWeight.w400,
        color: AppColors.kGrey,
        height: lineHeight,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.kSecondary,
      labelStyle: const TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.kSecondary,
      ),
      indicatorColor: AppColors.kSecondary,
      unselectedLabelStyle: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w400,
        color: AppColors.kGrey,
      ),
      unselectedLabelColor: AppColors.kGrey,
    ),
  );
}
