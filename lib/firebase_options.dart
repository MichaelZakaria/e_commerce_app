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
    apiKey: 'AIzaSyBQYepDc5cqhwVbnGLkmn_gI2FGNEzDboI',
    appId: '1:2340707293:web:36f380d0f5e49b76723434',
    messagingSenderId: '2340707293',
    projectId: 'e-commerce-app-fe717',
    authDomain: 'e-commerce-app-fe717.firebaseapp.com',
    storageBucket: 'e-commerce-app-fe717.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCawICQn0AW1GC58b6LzuKzFz0s928jpkU',
    appId: '1:2340707293:android:9edd7f3998e4df58723434',
    messagingSenderId: '2340707293',
    projectId: 'e-commerce-app-fe717',
    storageBucket: 'e-commerce-app-fe717.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGUW8vbo5dcMkFPUghC2hjeamAYJlA9aQ',
    appId: '1:2340707293:ios:ee483c46eb4c1c4d723434',
    messagingSenderId: '2340707293',
    projectId: 'e-commerce-app-fe717',
    storageBucket: 'e-commerce-app-fe717.appspot.com',
    androidClientId: '2340707293-r3i5odhkf1entpi01m2bbkq520cra3pk.apps.googleusercontent.com',
    iosClientId: '2340707293-5fbiscjuort847l31t94bv6ef07afcm3.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceApp',
  );
}
