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
    apiKey: 'AIzaSyBWYg2ZwiYFqOSGDsP0Pq-I_1VtLDd4xIc',
    appId: '1:104493679267:web:e2324d227ad3f52244f516',
    messagingSenderId: '104493679267',
    projectId: 'hoodedhaven-eab8b',
    authDomain: 'hoodedhaven-eab8b.firebaseapp.com',
    storageBucket: 'hoodedhaven-eab8b.appspot.com',
    measurementId: 'G-ETKQN8F0KS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJ3LR4vFSGSp6xisSg6Uldah6Sq3y33FY',
    appId: '1:104493679267:android:52c607f7d438637244f516',
    messagingSenderId: '104493679267',
    projectId: 'hoodedhaven-eab8b',
    storageBucket: 'hoodedhaven-eab8b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBavsNxhOPdtmbGYXTfTCP2Ht3Oq4Wxfbc',
    appId: '1:104493679267:ios:039e10c941a39ff044f516',
    messagingSenderId: '104493679267',
    projectId: 'hoodedhaven-eab8b',
    storageBucket: 'hoodedhaven-eab8b.appspot.com',
    androidClientId: '104493679267-gtmpkv3r6oli4g0cnpmu2f70esgprr1l.apps.googleusercontent.com',
    iosClientId: '104493679267-mrekc2k28g4kbpks7tndqo27fne59ipk.apps.googleusercontent.com',
    iosBundleId: 'com.example.hoodedhaven',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBavsNxhOPdtmbGYXTfTCP2Ht3Oq4Wxfbc',
    appId: '1:104493679267:ios:039e10c941a39ff044f516',
    messagingSenderId: '104493679267',
    projectId: 'hoodedhaven-eab8b',
    storageBucket: 'hoodedhaven-eab8b.appspot.com',
    androidClientId: '104493679267-gtmpkv3r6oli4g0cnpmu2f70esgprr1l.apps.googleusercontent.com',
    iosClientId: '104493679267-mrekc2k28g4kbpks7tndqo27fne59ipk.apps.googleusercontent.com',
    iosBundleId: 'com.example.hoodedhaven',
  );
}