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
    apiKey: 'AIzaSyA8nVPnBrbHy0-nr7B_UV8PfKCJaIFv_nM',
    appId: '1:226556785229:web:d25a6b3ae27653e136e204',
    messagingSenderId: '226556785229',
    projectId: 'propertytrader-899e0',
    authDomain: 'propertytrader-899e0.firebaseapp.com',
    storageBucket: 'propertytrader-899e0.appspot.com',
    measurementId: 'G-8TVDN6W6WF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWt-CqcwCAxHDBib1g2yKDJf7Z0i50OG0',
    appId: '1:226556785229:android:612518f788c083df36e204',
    messagingSenderId: '226556785229',
    projectId: 'propertytrader-899e0',
    storageBucket: 'propertytrader-899e0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCM6xni7jPx2nYBdq6qAe1CvB6q4R2M2g',
    appId: '1:226556785229:ios:1aa618b5244b5d8736e204',
    messagingSenderId: '226556785229',
    projectId: 'propertytrader-899e0',
    storageBucket: 'propertytrader-899e0.appspot.com',
    iosBundleId: 'com.example.propertytrader',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCM6xni7jPx2nYBdq6qAe1CvB6q4R2M2g',
    appId: '1:226556785229:ios:84d355683c44f2f336e204',
    messagingSenderId: '226556785229',
    projectId: 'propertytrader-899e0',
    storageBucket: 'propertytrader-899e0.appspot.com',
    iosBundleId: 'com.example.propertytrader.RunnerTests',
  );
}
