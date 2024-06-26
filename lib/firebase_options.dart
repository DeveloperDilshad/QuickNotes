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
    apiKey: 'AIzaSyAaY95rZItHMmZLf5bkfdi9fLNa4JaJB0s',
    appId: '1:846018283214:web:6cdf53c97fce6459d3f29f',
    messagingSenderId: '846018283214',
    projectId: 'quick-notes-484b8',
    authDomain: 'quick-notes-484b8.firebaseapp.com',
    storageBucket: 'quick-notes-484b8.appspot.com',
    measurementId: 'G-SWVKEQ18PM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCq6CGULSyqy-cFPmOU0AXTtnQVxQe-KEE',
    appId: '1:846018283214:android:58b159867fd0cb60d3f29f',
    messagingSenderId: '846018283214',
    projectId: 'quick-notes-484b8',
    storageBucket: 'quick-notes-484b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDO2hZsiCq0g9bB7VorYOKWx53ffzwrv6o',
    appId: '1:846018283214:ios:43335bd7e55c244bd3f29f',
    messagingSenderId: '846018283214',
    projectId: 'quick-notes-484b8',
    storageBucket: 'quick-notes-484b8.appspot.com',
    iosBundleId: 'com.example.quicknotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDO2hZsiCq0g9bB7VorYOKWx53ffzwrv6o',
    appId: '1:846018283214:ios:43335bd7e55c244bd3f29f',
    messagingSenderId: '846018283214',
    projectId: 'quick-notes-484b8',
    storageBucket: 'quick-notes-484b8.appspot.com',
    iosBundleId: 'com.example.quicknotes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAaY95rZItHMmZLf5bkfdi9fLNa4JaJB0s',
    appId: '1:846018283214:web:7d1a1f36959db13fd3f29f',
    messagingSenderId: '846018283214',
    projectId: 'quick-notes-484b8',
    authDomain: 'quick-notes-484b8.firebaseapp.com',
    storageBucket: 'quick-notes-484b8.appspot.com',
    measurementId: 'G-4DBQDEDVNJ',
  );
}
