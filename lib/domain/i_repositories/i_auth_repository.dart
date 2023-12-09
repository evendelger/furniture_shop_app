import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

abstract interface class IAuthRepository {
  Future<UserCredential> signUp({required UserRegisterModel userRegModel});
  Future<UserCredential> signIn({required UserLogInModel userLogInModel});
  Future<UserCredential> signInAnonymously();
  bool isSignedIn();
  Future<void> resetPassword({required UserModel user});
  Future<void> signOut();
  UserModel get getCurrentUser;
}