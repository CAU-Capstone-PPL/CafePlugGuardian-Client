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
    apiKey: 'AIzaSyAFtKt2r1ECAjrxvVYvaW7UFWyciVQYR9k',
    appId: '1:893376042395:web:18ab1eeec9c70d8cb33d3e',
    messagingSenderId: '893376042395',
    projectId: 'cafeplugguardian-client-a6464',
    authDomain: 'cafeplugguardian-client-a6464.firebaseapp.com',
    storageBucket: 'cafeplugguardian-client-a6464.appspot.com',
    measurementId: 'G-1N7GGN1KSJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcVtmiNsDDPjCKzL5pY5yO6_awdJmk5s4',
    appId: '1:893376042395:android:dfc4edf47d109a1ab33d3e',
    messagingSenderId: '893376042395',
    projectId: 'cafeplugguardian-client-a6464',
    storageBucket: 'cafeplugguardian-client-a6464.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFcgOg8gp4emKsBrgb2Y6XvwxITbyKypU',
    appId: '1:893376042395:ios:d4811ef6d1c928b4b33d3e',
    messagingSenderId: '893376042395',
    projectId: 'cafeplugguardian-client-a6464',
    storageBucket: 'cafeplugguardian-client-a6464.appspot.com',
    iosBundleId: 'com.example.cafePlugGuardianClient',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFcgOg8gp4emKsBrgb2Y6XvwxITbyKypU',
    appId: '1:893376042395:ios:f6cccfe722e3d84bb33d3e',
    messagingSenderId: '893376042395',
    projectId: 'cafeplugguardian-client-a6464',
    storageBucket: 'cafeplugguardian-client-a6464.appspot.com',
    iosBundleId: 'com.example.cafePlugGuardianClient.RunnerTests',
  );
}
