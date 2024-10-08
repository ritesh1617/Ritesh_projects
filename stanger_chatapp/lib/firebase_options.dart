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
    apiKey: 'AIzaSyDS-y5D3pOKsFVgWEeHVl8BVm72YH9j6Xc',
    appId: '1:658168889458:web:61a064f74b959edf1082eb',
    messagingSenderId: '658168889458',
    projectId: 'chat-bfddc',
    authDomain: 'chat-bfddc.firebaseapp.com',
    storageBucket: 'chat-bfddc.appspot.com',
    measurementId: 'G-LYJJW1WT4P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXqUY8Dw44wzNpqijsSQmlea7tklwq0yY',
    appId: '1:658168889458:android:dbae37443257d5b41082eb',
    messagingSenderId: '658168889458',
    projectId: 'chat-bfddc',
    storageBucket: 'chat-bfddc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLVK4kW7PDJJ22CEI6IWtNQgH_WPDteoI',
    appId: '1:658168889458:ios:bd4e724a4f7635451082eb',
    messagingSenderId: '658168889458',
    projectId: 'chat-bfddc',
    storageBucket: 'chat-bfddc.appspot.com',
    iosBundleId: 'com.example.stangerChatapp',
  );
}
