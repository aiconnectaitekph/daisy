import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCyF6NHnxAOI3FYiDP4BrPqWYvrwhWhMKA",
            authDomain: "daisy-n7g20a.firebaseapp.com",
            projectId: "daisy-n7g20a",
            storageBucket: "daisy-n7g20a.appspot.com",
            messagingSenderId: "225362605902",
            appId: "1:225362605902:web:c24f418cb28e2274c3d01f"));
  } else {
    await Firebase.initializeApp();
  }
}
