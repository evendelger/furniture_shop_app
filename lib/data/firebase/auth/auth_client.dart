import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/domain/models/user_model.dart';
import 'package:talker/talker.dart';

class AuthClient {
  AuthClient() {
    // бывает, что не получается получить event с userChanges(), поэтому сначала
    // беру currentUser, чтобы не получить ошибки при инициализации
    _currentUser = UserModel.fromFbModel(_auth.currentUser);
    // слушаю изменения в аутентификакии и записываю их в переменную
    _auth.userChanges().map((user) => UserModel.fromFbModel(user)).listen(
      (userModel) {
        _currentUser = userModel;
      },
    );
  }

  static final _auth = FirebaseAuth.instance;

  late UserModel _currentUser;

  UserModel get getCurrentUser => _currentUser;

  String get getUserId => _currentUser.uid!;

  String get getUserName => _currentUser.displayName!;

  String? get getUserEmail => _currentUser.email;

  String? get getUserImage => _currentUser.photoURL;

  Future<void> updatePhotoURL(String photoUrl) async =>
      _auth.currentUser!.updatePhotoURL(photoUrl);

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

  // TODO
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
