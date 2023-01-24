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
    apiKey: 'AIzaSyBtxbkgU1kgegiLf-FkDvIffROt8CP4fdY',
    appId: '1:195217092753:web:529436072d1aa78d81cf30',
    messagingSenderId: '195217092753',
    projectId: 'firebase-and-authapp',
    authDomain: 'fir-and-authapp.firebaseapp.com',
    storageBucket: 'firebase-and-authapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTBIPo4OPta0-BB75BP85jpamx82vePc8',
    appId: '1:195217092753:android:f2f84623e77ae40081cf30',
    messagingSenderId: '195217092753',
    projectId: 'firebase-and-authapp',
    storageBucket: 'firebase-and-authapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbO40hPg0ENqasWxgba-sQ74YpZ_nEBRo',
    appId: '1:195217092753:ios:038bde0881041a7b81cf30',
    messagingSenderId: '195217092753',
    projectId: 'firebase-and-authapp',
    storageBucket: 'firebase-and-authapp.appspot.com',
    iosClientId: '195217092753-aaf3e5dkcgllpdsbfn7id1etf0iv1rfb.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTodoAndAuthApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbO40hPg0ENqasWxgba-sQ74YpZ_nEBRo',
    appId: '1:195217092753:ios:038bde0881041a7b81cf30',
    messagingSenderId: '195217092753',
    projectId: 'firebase-and-authapp',
    storageBucket: 'firebase-and-authapp.appspot.com',
    iosClientId: '195217092753-aaf3e5dkcgllpdsbfn7id1etf0iv1rfb.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTodoAndAuthApp',
  );
}