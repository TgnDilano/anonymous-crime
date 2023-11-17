import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macos_ui_app/app/config/routes/routes.dart';
import 'package:macos_ui_app/app/controller/app_controller.dart';
import 'package:macos_ui_app/app/pages/login_page.dart';

typedef MapOfString = Map<String, dynamic>;

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final initialLocation = AppRoutes.loginPage.path;
final initialRouteName = AppRoutes.loginPage.name;

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _parentKey,
    initialLocation: AppRoutes.loginPage.path,
    refreshListenable: AppController.find.isLoggedIn,
    redirect: (context, state) {
      final bool onloginPage = state.location == AppRoutes.loginPage.path;
      final bool userAutheticated = AppController.find.isLoggedIn.value;

      if (!userAutheticated) {
        return AppRoutes.loginPage.path;
      }

      if (userAutheticated && onloginPage) {
        return AppRoutes.homenPage.path;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.loginPage.path,
        name: AppRoutes.loginPage.name,
        builder: (state, context) => const LoginPage(),
      ),
    ],
  );
}
