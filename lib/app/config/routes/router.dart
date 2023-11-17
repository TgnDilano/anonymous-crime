import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macos_ui_app/app/config/routes/routes.dart';
import 'package:macos_ui_app/app/controller/app_controller.dart';
import 'package:macos_ui_app/app/pages/dashboard.dart';
import 'package:macos_ui_app/app/pages/home_page.dart';
import 'package:macos_ui_app/app/pages/login_page.dart';
import 'package:macos_ui_app/app/pages/message_page.dart';
import 'package:macos_ui_app/app/pages/register_page.dart';
import 'package:macos_ui_app/app/pages/report_case.dart';

typedef MapOfString = Map<String, dynamic>;

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final initialLocation = AppRoutes.loginPage.path;
final initialRouteName = AppRoutes.loginPage.name;

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _parentKey,
    initialLocation: AppRoutes.dashboardPage.path,
    refreshListenable: AppController.find.isLoggedIn,
    redirect: (context, state) {
      final bool onloginPage = state.location == AppRoutes.loginPage.path;
      final bool userAutheticated = AppController.find.isLoggedIn.value;

      if(state.location == AppRoutes.registerPage.path){
        return AppRoutes.loginPage.path;
      }

      if (!userAutheticated) {
        return AppRoutes.loginPage.path;
      }

      if (userAutheticated && onloginPage) {
        return AppRoutes.dashboardPage.path;
      }

      return null;
    },
    routes: [
      ShellRoute(
        navigatorKey: _shellKey,
        builder: (context, state, child) {
          return HomePage(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.dashboardPage.path,
            name: AppRoutes.dashboardPage.name,
            builder: (state, context) => const DashboardPage(),
          ),
          GoRoute(
            path: AppRoutes.reportCase.path,
            name: AppRoutes.reportCase.name,
            builder: (state, context) => const ReportCase(),
          ),
          GoRoute(
            path: AppRoutes.messagePage.path,
            name: AppRoutes.messagePage.name,
            builder: (state, context) => const MessagePage(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.loginPage.path,
        name: AppRoutes.loginPage.name,
        builder: (state, context) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.registerPage.path,
        name: AppRoutes.registerPage.name,
        builder: (state, context) => const RegisterPage(),
      ),
    ],
  );
}
