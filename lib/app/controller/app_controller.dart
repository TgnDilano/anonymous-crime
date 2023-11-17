import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:macos_ui_app/app/extensions/number_ext.dart';
import 'package:macos_ui_app/app/model/user_model.dart';
import 'package:macos_ui_app/app/services/storage_services.dart';

class AppController extends GetxController {
  static AppController get find => Get.find<AppController>();

  Future<void> init() async {
    await dotenv.load(fileName: ".env");
    await storageServices.initPrefs();
  }

  final storageServices = LocalStoregeServices();

  final appLocale = const Locale("fr").vn;

  final isLoggedIn = false.vn;
  final isDarkMode = false.vn;
  final isInitialising = true.vn;

  BuildContext? _context;

  String get token => "";

  User get user {
    return storageServices.user ?? UserModel.defaultUser().user;
  }

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
