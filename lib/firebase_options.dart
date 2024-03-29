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
    apiKey: 'AIzaSyAxpvmNBxG89DdRm5gmqFNExOIzI_W9oiY',
    appId: '1:185513394283:web:a4e31d4179dbcf7f08712e',
    messagingSenderId: '185513394283',
    projectId: 'sahopay-firebase',
    authDomain: 'sahopay-firebase.firebaseapp.com',
    storageBucket: 'sahopay-firebase.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCW8SGkZpF5z9klpnyX7r_4HzmH1Aumtb8',
    appId: '1:185513394283:android:77d101269177a59f08712e',
    messagingSenderId: '185513394283',
    projectId: 'sahopay-firebase',
    storageBucket: 'sahopay-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4PSTIgGbkKkYmkXfNcH5RHIYenqlPicA',
    appId: '1:185513394283:ios:5f65c0a3e9f2849008712e',
    messagingSenderId: '185513394283',
    projectId: 'sahopay-firebase',
    storageBucket: 'sahopay-firebase.appspot.com',
    iosBundleId: 'com.application.sahopay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4PSTIgGbkKkYmkXfNcH5RHIYenqlPicA',
    appId: '1:185513394283:ios:5f65c0a3e9f2849008712e',
    messagingSenderId: '185513394283',
    projectId: 'sahopay-firebase',
    storageBucket: 'sahopay-firebase.appspot.com',
    iosBundleId: 'com.application.sahopay',
  );


}
