import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBc4aAeNP97mXWJWEZ0KdWFqmB0YVA0jms",
            authDomain: "mi-seguridad-uamx.firebaseapp.com",
            projectId: "mi-seguridad-uamx",
            storageBucket: "mi-seguridad-uamx.firebasestorage.app",
            messagingSenderId: "113888301840",
            appId: "1:113888301840:web:2916da9f8ee7990da94b95",
            measurementId: "G-416X2L43T1"));
  } else {
    await Firebase.initializeApp();
  }
}
