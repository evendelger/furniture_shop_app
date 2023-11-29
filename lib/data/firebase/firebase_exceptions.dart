import 'package:firebase_core/firebase_core.dart';

class FirebaseExceptions {
  late String _message;

  String get message => _message;

  FirebaseExceptions.fromFirebaseError(FirebaseException firebaseError) {
    switch (firebaseError.code) {
      // sign out
      case 'weak-password':
        _message = 'The password is too weak';
        break;
      case 'email-already-in-use':
        _message = 'Email is already in use, try another.';
        break;
      case 'invalid-email':
        _message = 'Email is invalid, try another.';
        break;
      // sign in
      case 'user-not-found':
        _message = 'No user found for that email.';
        break;
      case 'wrong-password':
        _message = 'Entered incorrect password.';
        break;
      case 'invalid-credential':
        _message = 'User not found';
        break;
      default:
        _message = 'Unknown error.';
    }
  }
}
