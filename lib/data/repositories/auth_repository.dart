import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/data/firebase/auth/auth_client.dart';
import 'package:furniture_shop_app/data/firebase/firebase_exceptions.dart';
import 'package:furniture_shop_app/data/firebase/firestore/firestore_client.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/i_repositories/repositories.dart';
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
  Future<UserCredential> signUp({
    required UserRegisterModel userRegModel,
  }) async {
    try {
      final userCredential = await authClient.signUp(
        email: userRegModel.email,
        password: userRegModel.password,
      );
      await userCredential.user?.updateDisplayName(userRegModel.displayName);
      firestoreClient.createCollections(userId: userCredential.user!.uid);
      return userCredential;
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<UserCredential> signIn({
    required UserLogInModel userLogInModel,
  }) async {
    try {
      final userCredential = await authClient.signIn(
        email: userLogInModel.email,
        password: userLogInModel.password,
      );
      return userCredential;
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
  Future<UserCredential> signInAnonymously() async {
    try {
      final userCredential = await authClient.signInAnonymous();
      firestoreClient.createCollections(userId: userCredential.user!.uid);
      return userCredential;
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }
}
