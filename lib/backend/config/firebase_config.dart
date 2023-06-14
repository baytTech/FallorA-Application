import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDu7KbQWXM7JjEPXiqrpxfH-O8RMQxPipE",
            authDomain: "fallora.firebaseapp.com",
            projectId: "fallora",
            storageBucket: "fallora.appspot.com",
            messagingSenderId: "237118916916",
            appId: "1:237118916916:web:1b2ba95d43e9727753bd61"));
  } else {
    await Firebase.initializeApp();
  }
}
