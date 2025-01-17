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
    apiKey: 'AIzaSyD0h1S4D7F59xC1b2hoQ3fVcfkAhDg9sSA',
    appId: '1:507999197386:web:9bb7b9ac142160a5eb3c33',
    messagingSenderId: '507999197386',
    projectId: 'uji-coba-rapid',
    authDomain: 'uji-coba-rapid.firebaseapp.com',
    storageBucket: 'uji-coba-rapid.appspot.com',
    measurementId: 'G-PBTYBZTVPZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2Ap3OHR31NyLazWF1CbMlWQ-EcaY_enM',
    appId: '1:507999197386:android:6fa7fb2b7edceddbeb3c33',
    messagingSenderId: '507999197386',
    projectId: 'uji-coba-rapid',
    storageBucket: 'uji-coba-rapid.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUJ1cfVmo16Utt-j0DZMtULfpAVkda1RU',
    appId: '1:507999197386:ios:45cd59af56ff3bb2eb3c33',
    messagingSenderId: '507999197386',
    projectId: 'uji-coba-rapid',
    storageBucket: 'uji-coba-rapid.appspot.com',
    iosBundleId: 'com.isoae.rapidhome',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUJ1cfVmo16Utt-j0DZMtULfpAVkda1RU',
    appId: '1:507999197386:ios:45cd59af56ff3bb2eb3c33',
    messagingSenderId: '507999197386',
    projectId: 'uji-coba-rapid',
    storageBucket: 'uji-coba-rapid.appspot.com',
    iosBundleId: 'com.isoae.rapidhome',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD0h1S4D7F59xC1b2hoQ3fVcfkAhDg9sSA',
    appId: '1:507999197386:web:060d83c793f2b574eb3c33',
    messagingSenderId: '507999197386',
    projectId: 'uji-coba-rapid',
    authDomain: 'uji-coba-rapid.firebaseapp.com',
    storageBucket: 'uji-coba-rapid.appspot.com',
    measurementId: 'G-3KQKHVR8K8',
  );
}
