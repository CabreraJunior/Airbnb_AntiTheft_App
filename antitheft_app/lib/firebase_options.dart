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
    apiKey: 'AIzaSyDz56_nf1busWDi5GKJtPyE0CROgIr3K2Y',
    appId: '1:951488395844:web:6ddf223f6e456fd1095a11',
    messagingSenderId: '951488395844',
    projectId: 'antitheftapp-63d86',
    authDomain: 'antitheftapp-63d86.firebaseapp.com',
    databaseURL: 'https://antitheftapp-63d86-default-rtdb.firebaseio.com',
    storageBucket: 'antitheftapp-63d86.appspot.com',
    measurementId: 'G-KCCWN92B52',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTRu8eyTzGSWFQj_6biKXVTclTgWbevTo',
    appId: '1:951488395844:android:4010b6408af96e99095a11',
    messagingSenderId: '951488395844',
    projectId: 'antitheftapp-63d86',
    databaseURL: 'https://antitheftapp-63d86-default-rtdb.firebaseio.com',
    storageBucket: 'antitheftapp-63d86.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBL2NPQglBAvYHClQLShLA9GwXeX1w2OHA',
    appId: '1:951488395844:ios:4842347a9637f975095a11',
    messagingSenderId: '951488395844',
    projectId: 'antitheftapp-63d86',
    databaseURL: 'https://antitheftapp-63d86-default-rtdb.firebaseio.com',
    storageBucket: 'antitheftapp-63d86.appspot.com',
    iosClientId: '951488395844-79sdjeqksmda42lerijtc97jviuli2v4.apps.googleusercontent.com',
    iosBundleId: 'com.example.antitheftApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBL2NPQglBAvYHClQLShLA9GwXeX1w2OHA',
    appId: '1:951488395844:ios:4842347a9637f975095a11',
    messagingSenderId: '951488395844',
    projectId: 'antitheftapp-63d86',
    databaseURL: 'https://antitheftapp-63d86-default-rtdb.firebaseio.com',
    storageBucket: 'antitheftapp-63d86.appspot.com',
    iosClientId: '951488395844-79sdjeqksmda42lerijtc97jviuli2v4.apps.googleusercontent.com',
    iosBundleId: 'com.example.antitheftApp',
  );
}