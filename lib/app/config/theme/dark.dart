import 'package:flutter/material.dart';
import 'package:macos_ui_app/app/config/theme/light.dart';
import 'package:macos_ui_app/app/constants/colors.dart';

class DarkThemeData {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: const Color.fromARGB(255, 125, 125, 125),
    fontFamily: "SharpGrotesk",
    cardColor: AppColors.kBlackGray,
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.black,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFFB780),
      onPrimary: Color(0xFF4E2600),
      primaryContainer: Color(0xFF6F3800),
      onPrimaryContainer: Color(0xFFFFDCC4),
      secondary: Color(0xFFFFB86B),
      // secondary: Color(0xFF808080),
      onSecondary: Color(0xFF492900),
      secondaryContainer: Color(0xFF683D00),
      onSecondaryContainer: Color(0xFFFFDCBC),
      tertiary: Color(0xFFC6CB95),
      onTertiary: Color(0xFF2F330C),
      tertiaryContainer: Color(0xFF454A21),
      onTertiaryContainer: Color(0xFFE2E7AF),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      background: Color(0xFF201A17),
      onBackground: Color(0xFFECE0DA),
      surface: Color(0xFF201A17),
      onSurface: Color(0xFFECE0DA),
      surfaceVariant: Color(0xFF51443B),
      onSurfaceVariant: Color(0xFFD6C3B7),
      outline: Color(0xFF9F8D82),
      onInverseSurface: Color(0xFF201A17),
      inverseSurface: Color(0xFFECE0DA),
      inversePrimary: Color(0xFF924C00),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFFFFB780),
      outlineVariant: Color(0xFF51443B),
      scrim: Color(0xFF000000),
    ),
    checkboxTheme: const CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: BorderSide(
        width: 0.8,
        color: AppColors.kSecondary,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: "SharpGrotesk",
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: lineHeight,
        letterSpacing: -0.4,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: AppColors.kBlackGray,
      elevation: 0.6,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white30,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: lineHeight,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        height: lineHeight,
      ),
      titleSmall: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: lineHeight,
      ),
      bodyLarge: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: lineHeight,
      ),
      bodyMedium: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        height: lineHeight,
      ),
      bodySmall: TextStyle(
        fontSize: defaultFontSize - 1,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: lineHeight,
      ),
      displayLarge: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.kIconGray,
        height: lineHeight,
      ),
      displayMedium: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.kIconGray,
        height: lineHeight,
      ),
      displaySmall: TextStyle(
        fontSize: defaultFontSize - 1,
        fontWeight: FontWeight.w400,
        color: AppColors.kIconGray,
        height: lineHeight,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.white12,
      thickness: 0.6,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.kSecondary,
      labelStyle: const TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.kSecondary,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w400,
        color: AppColors.kGrey,
      ),
      unselectedLabelColor: AppColors.kGrey,
    ),
  );
}
