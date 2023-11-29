import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

abstract class AbstractAuthRepository {
  Future<UserCredential> signUp(UserModel user);
  Future<UserCredential> signIn(UserModel user);
  Future<UserCredential> signInAnonymously();
  Stream<UserModel> getUserStream();
  Future<bool> isSignedIn();
  Future<void> resetPassword(UserModel user);
  Future<void> signOut();
}
