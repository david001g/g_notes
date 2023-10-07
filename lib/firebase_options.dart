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
    apiKey: 'AIzaSyBdUl5hB32i_W3dq-WKiBVUR4M4t13tCKs',
    appId: '1:269545314442:web:2d5f771818570de15cf573',
    messagingSenderId: '269545314442',
    projectId: 'g-notes-3e912',
    authDomain: 'g-notes-3e912.firebaseapp.com',
    storageBucket: 'g-notes-3e912.appspot.com',
    measurementId: 'G-YD09ZTWNFY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEGHA2DPo3SlA8WAdrDIPfa8vUqgUB6-E',
    appId: '1:269545314442:android:1c7b21f77674efdd5cf573',
    messagingSenderId: '269545314442',
    projectId: 'g-notes-3e912',
    storageBucket: 'g-notes-3e912.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkPiQOMmrplCyKC37gedV9WmN5UDWx0cw',
    appId: '1:269545314442:ios:41e5095ac51f6b7b5cf573',
    messagingSenderId: '269545314442',
    projectId: 'g-notes-3e912',
    storageBucket: 'g-notes-3e912.appspot.com',
    iosBundleId: 'com.example.gNotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkPiQOMmrplCyKC37gedV9WmN5UDWx0cw',
    appId: '1:269545314442:ios:6bf709fcd34075b25cf573',
    messagingSenderId: '269545314442',
    projectId: 'g-notes-3e912',
    storageBucket: 'g-notes-3e912.appspot.com',
    iosBundleId: 'com.example.gNotes.RunnerTests',
  );
}