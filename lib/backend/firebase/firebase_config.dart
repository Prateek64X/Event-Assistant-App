import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBIJ8xBFy17KfSHk6rw7lujNrKg3uaj8pc",
            authDomain: "eventassistantapp.firebaseapp.com",
            projectId: "eventassistantapp",
            storageBucket: "eventassistantapp.appspot.com",
            messagingSenderId: "88423367260",
            appId: "1:88423367260:web:7bfe08585d51a019b61c99",
            measurementId: "G-G293EZ9B9E"));
  } else {
    await Firebase.initializeApp();
  }
}
