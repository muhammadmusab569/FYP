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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAbm5QICvfknEa00ZRz4CCC2KPHasJKqhM',
    appId: '1:58778970687:web:caf20648cc2e9f1094268a',
    messagingSenderId: '58778970687',
    projectId: 'fyp-2-70fa3',
    authDomain: 'fyp-2-70fa3.firebaseapp.com',
    storageBucket: 'fyp-2-70fa3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPDuTlRDJfpo7QTuGzCMgC_AOO2qcUydY',
    appId: '1:58778970687:android:7db650be7a89b40c94268a',
    messagingSenderId: '58778970687',
    projectId: 'fyp-2-70fa3',
    storageBucket: 'fyp-2-70fa3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjZKOdVmCGuLwvm6f_MeayekP6CUQKxm4',
    appId: '1:58778970687:ios:a7d2cc533a7a260594268a',
    messagingSenderId: '58778970687',
    projectId: 'fyp-2-70fa3',
    storageBucket: 'fyp-2-70fa3.appspot.com',
    iosBundleId: 'com.example.fyp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAbm5QICvfknEa00ZRz4CCC2KPHasJKqhM',
    appId: '1:58778970687:web:af9a9c22d9e54d3e94268a',
    messagingSenderId: '58778970687',
    projectId: 'fyp-2-70fa3',
    authDomain: 'fyp-2-70fa3.firebaseapp.com',
    storageBucket: 'fyp-2-70fa3.appspot.com',
  );
}
