import 'package:firebase_core/firebase_core.dart';

class FirebaseClient {
  Future<FirebaseApp> _initFirebase() async {
    final firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
