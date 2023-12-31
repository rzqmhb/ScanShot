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
    apiKey: 'AIzaSyBoZhEVd5HJyhSBmz5-yIhMbiRsfNWHa6o',
    appId: '1:712311962804:web:bd701540f7ddc25dea6be1',
    messagingSenderId: '712311962804',
    projectId: 'scanshot-17688',
    authDomain: 'scanshot-17688.firebaseapp.com',
    storageBucket: 'scanshot-17688.appspot.com',
    measurementId: 'G-MW0EKVJXT9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA137yk3z08O-VLN1fP7buR9H2KFO55Mu4',
    appId: '1:712311962804:android:3af06cd6cb90b9fcea6be1',
    messagingSenderId: '712311962804',
    projectId: 'scanshot-17688',
    storageBucket: 'scanshot-17688.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArpM8wRHklq_jDUqWyjrSMuGJCtuYD2s0',
    appId: '1:712311962804:ios:d1dce49d1c61a015ea6be1',
    messagingSenderId: '712311962804',
    projectId: 'scanshot-17688',
    storageBucket: 'scanshot-17688.appspot.com',
    iosBundleId: 'com.example.scanshot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArpM8wRHklq_jDUqWyjrSMuGJCtuYD2s0',
    appId: '1:712311962804:ios:0e97e43362e8d625ea6be1',
    messagingSenderId: '712311962804',
    projectId: 'scanshot-17688',
    storageBucket: 'scanshot-17688.appspot.com',
    iosBundleId: 'com.example.scanshot.RunnerTests',
  );
}
