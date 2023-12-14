import 'package:furniture_shop_app/domain/models/models.dart';

abstract interface class IAuthRepository {
  Future<UserModel> signUp({required UserRegisterModel userRegModel});
  Future<UserModel> signIn({required UserLogInModel userLogInModel});
  Future<UserModel> signInAnonymously();
  bool isSignedIn();
  Future<void> resetPassword({required UserModel user});
  Future<void> signOut();
  UserModel get getCurrentUser;
}
