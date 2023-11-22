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
    apiKey: 'AIzaSyC8TEfpf0HybQRiFqIxu7NEyI66697pwGA',
    appId: '1:929181135219:web:9122843762bd8c2ec8d506',
    messagingSenderId: '929181135219',
    projectId: 'furniture-shop-app-5427',
    authDomain: 'furniture-shop-app-5427.firebaseapp.com',
    storageBucket: 'furniture-shop-app-5427.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKInDBa4tdupGRtQmKodNy7ra8z201Zag',
    appId: '1:929181135219:android:adb943476c4f1513c8d506',
    messagingSenderId: '929181135219',
    projectId: 'furniture-shop-app-5427',
    storageBucket: 'furniture-shop-app-5427.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA46OtJHJFFRNx2SemKeZ7hShIh17Tunao',
    appId: '1:929181135219:ios:7a77a2ee1b7053afc8d506',
    messagingSenderId: '929181135219',
    projectId: 'furniture-shop-app-5427',
    storageBucket: 'furniture-shop-app-5427.appspot.com',
    iosBundleId: 'com.example.furnitureShopApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA46OtJHJFFRNx2SemKeZ7hShIh17Tunao',
    appId: '1:929181135219:ios:d504261de48212d6c8d506',
    messagingSenderId: '929181135219',
    projectId: 'furniture-shop-app-5427',
    storageBucket: 'furniture-shop-app-5427.appspot.com',
    iosBundleId: 'com.example.furnitureShopApp.RunnerTests',
  );
}