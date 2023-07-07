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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAhqGX1jckkSTCaOfoTKNCH2XEofvsfrFU',
    appId: '1:939861289600:web:f37a2a45189a4ad1045465',
    messagingSenderId: '939861289600',
    projectId: 'consultant-1dae6',
    authDomain: 'consultant-1dae6.firebaseapp.com',
    storageBucket: 'consultant-1dae6.appspot.com',
    measurementId: 'G-Z1B6SVVSDF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcc9RWDbFeXq2PqbrWeZQJvFWu5PF5jCw',
    appId: '1:939861289600:android:8d902ecc87a2577c045465',
    messagingSenderId: '939861289600',
    projectId: 'consultant-1dae6',
    storageBucket: 'consultant-1dae6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCykxdDIgoI8BcTnNd7sHA5hW9RahCgsAQ',
    appId: '1:939861289600:ios:c867b054a8a83c5d045465',
    messagingSenderId: '939861289600',
    projectId: 'consultant-1dae6',
    storageBucket: 'consultant-1dae6.appspot.com',
    iosClientId: '939861289600-oqpr2as475636afqqtub85v16tbbm91j.apps.googleusercontent.com',
    iosBundleId: 'com.example.consultPatient',
  );
}