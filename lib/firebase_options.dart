// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
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
    apiKey: 'AIzaSyCCTo2CSdc53EzleykTA4KoEoOdqKo0tHM',
    appId: '1:652938711020:web:84f3ab48d9ab4b63b1fac9',
    messagingSenderId: '652938711020',
    projectId: 'fir-6e776',
    authDomain: 'fir-6e776.firebaseapp.com',
    databaseURL:
        'https://fir-6e776-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-6e776.appspot.com',
    measurementId: 'G-EM1TDLDBBQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8NE2jLi8B1QjLHy4yQmpvl_CIT3kIpRE',
    appId: '1:652938711020:android:ad6ae7532307a2f6b1fac9',
    messagingSenderId: '652938711020',
    projectId: 'fir-6e776',
    databaseURL:
        'https://fir-6e776-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-6e776.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtI8KgtUiHsAX3VmZ0HSHgYxRojisKA0M',
    appId: '1:652938711020:ios:29f2846b5d26444cb1fac9',
    messagingSenderId: '652938711020',
    projectId: 'fir-6e776',
    databaseURL:
        'https://fir-6e776-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-6e776.appspot.com',
    iosBundleId: 'com.example.demo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtI8KgtUiHsAX3VmZ0HSHgYxRojisKA0M',
    appId: '1:652938711020:ios:5d198b8d6f3586a3b1fac9',
    messagingSenderId: '652938711020',
    projectId: 'fir-6e776',
    databaseURL:
        'https://fir-6e776-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'fir-6e776.appspot.com',
    iosBundleId: 'com.example.demo.RunnerTests',
  );
}
