import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/data/firebase/auth/auth_client.dart';
import 'package:furniture_shop_app/data/firebase/firebase_exceptions.dart';
import 'package:furniture_shop_app/data/firebase/firestore/firestore_client.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:talker/talker.dart';

class AuthRepository implements IAuthRepository {
  const AuthRepository({
    required this.firestoreClient,
    required this.authClient,
  });

  final AuthClient authClient;
  final FirestoreClient firestoreClient;

  @override
  UserModel get getCurrentUser => authClient.getCurrentUser;

  @override
  bool isSignedIn() {
    final user = authClient.getCurrentUser;
    Talker().log(user);
    return user.isAuthorized;
  }

  @override
  Future<UserModel> signUp({
    required UserRegisterModel userRegModel,
  }) async {
    try {
      final userCredential = await authClient.signUp(
        email: userRegModel.email,
        password: userRegModel.password,
      );
      userCredential.user?.updateDisplayName(userRegModel.displayName);
      firestoreClient.createCollections(userId: userCredential.user!.uid);

      final userModel = authClient.getCurrentUser.copyWith(
        displayName: userRegModel.displayName,
      );

      return userModel;
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<UserModel> signIn({
    required UserLogInModel userLogInModel,
  }) async {
    try {
      await authClient.signIn(
        email: userLogInModel.email,
        password: userLogInModel.password,
      );
      final userModel = authClient.getCurrentUser;
      return userModel;
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<void> signOut() async => await authClient.signOut();

  @override
  Future<void> resetPassword({required UserModel user}) async {
    try {
      await authClient.resetPassword(email: user.email!);
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<UserModel> signInAnonymously() async {
    try {
      final userCredential = await authClient.signInAnonymous();
      firestoreClient.createCollections(userId: userCredential.user!.uid);
      final userModel = UserModel.fromUserCredential(userCredential);

      return userModel;
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }
}
