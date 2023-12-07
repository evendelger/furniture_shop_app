import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/domain/models/user_model.dart';
import 'package:talker/talker.dart';

class AuthClient {
  AuthClient() {
    // слушаю изменения в аутентификакии и записываю их в переменную
    _auth.userChanges().map((user) => UserModel.fromFbModel(user)).listen(
      (userModel) {
        _currentUser = userModel;
      },
    );
  }

  final _auth = FirebaseAuth.instance;
  UserModel? _currentUser;

  UserModel get getCurrentUser =>
      _currentUser ?? UserModel.fromFbModel(_auth.currentUser);
  String get getUserId => getCurrentUser.uid!;

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
