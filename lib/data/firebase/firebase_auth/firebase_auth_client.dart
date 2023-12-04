import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/domain/models/user_model.dart';
import 'package:talker/talker.dart';

class AuthClient {
  AuthClient();

  final _auth = FirebaseAuth.instance;

  String get getUserId => _auth.currentUser!.uid;

  Stream<UserModel> retrieveCurrentUser() =>
      _auth.authStateChanges().map((user) => UserModel.fromFbModel(user));

  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      Talker().error(e);
      rethrow;
    }
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      Talker().error(e);
      rethrow;
    }
  }

  Future<UserCredential> signInAnonymous() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      Talker().error(e);
      rethrow;
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      Talker().error(e);
      rethrow;
    }
  }

  Future<void> signOut() async => await _auth.signOut();
}
