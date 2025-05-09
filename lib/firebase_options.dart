// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyADPq7S8hQ-XlyaZILW5yVGny2dTlo6ZSs',
    appId: '1:1001716518967:web:6985a019c31d833053efb2',
    messagingSenderId: '1001716518967',
    projectId: 'flutter-gympass',
    authDomain: 'flutter-gympass.firebaseapp.com',
    storageBucket: 'flutter-gympass.appspot.com',
    measurementId: 'G-N21W2CJ4CL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAf64JgRXP-zBAgs7I9G8EyhHm-NXmC1k',
    appId: '1:1001716518967:android:beca09ff92fbae7753efb2',
    messagingSenderId: '1001716518967',
    projectId: 'flutter-gympass',
    storageBucket: 'flutter-gympass.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwPZIivZsloKHURXhSo4IpzJobgAnmkEo',
    appId: '1:1001716518967:ios:1980ea6137794fa853efb2',
    messagingSenderId: '1001716518967',
    projectId: 'flutter-gympass',
    storageBucket: 'flutter-gympass.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwPZIivZsloKHURXhSo4IpzJobgAnmkEo',
    appId: '1:1001716518967:ios:1980ea6137794fa853efb2',
    messagingSenderId: '1001716518967',
    projectId: 'flutter-gympass',
    storageBucket: 'flutter-gympass.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyADPq7S8hQ-XlyaZILW5yVGny2dTlo6ZSs',
    appId: '1:1001716518967:web:e8730c864f3dbeba53efb2',
    messagingSenderId: '1001716518967',
    projectId: 'flutter-gympass',
    authDomain: 'flutter-gympass.firebaseapp.com',
    storageBucket: 'flutter-gympass.appspot.com',
    measurementId: 'G-R87NZKWS9D',
  );

}