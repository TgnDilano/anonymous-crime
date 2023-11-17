// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBXwOlxZSC6Nb017nSKGdjGBkBWbo7Rg18',
    appId: '1:795917205827:web:e65dd56b697c05e9926ff6',
    messagingSenderId: '795917205827',
    projectId: 'code-battle-8f4b3',
    authDomain: 'code-battle-8f4b3.firebaseapp.com',
    storageBucket: 'code-battle-8f4b3.appspot.com',
    measurementId: 'G-XMN04NS4C0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCST1y2Tqe9eO-2M9OR7-a1IMupoZO2Z9Y',
    appId: '1:795917205827:android:9ba35856a02074f4926ff6',
    messagingSenderId: '795917205827',
    projectId: 'code-battle-8f4b3',
    storageBucket: 'code-battle-8f4b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnMQbeydvUu34IjGC1kYgBcgmtrk4HOuc',
    appId: '1:795917205827:ios:46b5749291eea137926ff6',
    messagingSenderId: '795917205827',
    projectId: 'code-battle-8f4b3',
    storageBucket: 'code-battle-8f4b3.appspot.com',
    iosBundleId: 'com.example.macosUiApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDnMQbeydvUu34IjGC1kYgBcgmtrk4HOuc',
    appId: '1:795917205827:ios:81a5a7c36bbee2bd926ff6',
    messagingSenderId: '795917205827',
    projectId: 'code-battle-8f4b3',
    storageBucket: 'code-battle-8f4b3.appspot.com',
    iosBundleId: 'com.example.macosUiApp.RunnerTests',
  );
}
