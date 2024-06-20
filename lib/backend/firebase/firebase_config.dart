import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBWFRhtzxPX98qpJMsPa4bzelpTXZMGLJs",
            authDomain: "receipe-eval-4ot687.firebaseapp.com",
            projectId: "receipe-eval-4ot687",
            storageBucket: "receipe-eval-4ot687.appspot.com",
            messagingSenderId: "56196333352",
            appId: "1:56196333352:web:89afc96e76af82a3265a1d"));
  } else {
    await Firebase.initializeApp();
  }
}
