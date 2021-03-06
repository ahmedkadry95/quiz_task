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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAv05EgehsOMr3Em92_jSAJeINleHK0BI',
    appId: '1:444762407100:android:4ed2c18e327e072bdf50b9',
    messagingSenderId: '444762407100',
    projectId: 'task-36049',
    storageBucket: 'task-36049.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCewS9B-vOdIrFiirJeq6KDEauJMklU0wQ',
    appId: '1:444762407100:ios:3499df764e05dc0bdf50b9',
    messagingSenderId: '444762407100',
    projectId: 'task-36049',
    storageBucket: 'task-36049.appspot.com',
    iosClientId: '444762407100-6unn4g7ojsgmrlrt4qrv7j4lo7mhmhuo.apps.googleusercontent.com',
    iosBundleId: 'com.example.task',
  );
}
