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
    apiKey: 'AIzaSyC-cHMq_cS3r4-341CGvrR2celq8tCKwQE',
    appId: '1:699914462747:web:1b785b771b77534253fabe',
    messagingSenderId: '699914462747',
    projectId: 'prismatics-62cc4',
    authDomain: 'prismatics-62cc4.firebaseapp.com',
    storageBucket: 'prismatics-62cc4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCau3I7PpkRYJs1AicKGnzxmd-2GL89800',
    appId: '1:699914462747:android:b0fccda68f561af853fabe',
    messagingSenderId: '699914462747',
    projectId: 'prismatics-62cc4',
    storageBucket: 'prismatics-62cc4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwO27pjmMYR4Cy1U7kjHq7Yz1DqaU_DQg',
    appId: '1:699914462747:ios:033aa4c922adf3bb53fabe',
    messagingSenderId: '699914462747',
    projectId: 'prismatics-62cc4',
    storageBucket: 'prismatics-62cc4.appspot.com',
    iosBundleId: 'com.example.prismatics',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwO27pjmMYR4Cy1U7kjHq7Yz1DqaU_DQg',
    appId: '1:699914462747:ios:d580cd4ca441dbd053fabe',
    messagingSenderId: '699914462747',
    projectId: 'prismatics-62cc4',
    storageBucket: 'prismatics-62cc4.appspot.com',
    iosBundleId: 'com.example.prismatics.RunnerTests',
  );
}
