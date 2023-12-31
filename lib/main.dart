import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macos_ui_app/app/config/routes/router.dart';
import 'package:macos_ui_app/app/config/scroll_config.dart';
import 'package:macos_ui_app/app/config/theme/dark.dart';
import 'package:macos_ui_app/app/config/theme/light.dart';
import 'package:macos_ui_app/app/controller/app_controller.dart';
import 'package:macos_ui_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.put(AppController()).init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: LightThemeData.theme,
      darkTheme: DarkThemeData.theme,
      themeMode: ThemeMode.light,
      builder: (context, widget) {
        return ScrollConfiguration(
          behavior: const AppScrollBehavior(),
          child: widget!,
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        return true;
      };
  }
}
