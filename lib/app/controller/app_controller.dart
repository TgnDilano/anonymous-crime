import 'package:anonymous/app/extensions/number_ext.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get find => Get.find<AppController>();

  final appLocale = const Locale("fr").vn;

  final isLoggedIn = false.vn;
  final isDarkMode = false.vn;
  final isInitialising = true.vn;

  BuildContext? _context;

  String get token => "";

  setAppContext(BuildContext context) {
    if (_context != null) return;
    _context = context;
  }

  BuildContext? get appContext {
    return _context;
  }

  bool get isAdmin {
    return false;
  }
}
