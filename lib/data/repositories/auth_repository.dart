import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/data/firebase/auth/auth_client.dart';
import 'package:furniture_shop_app/data/firebase/firebase_exceptions.dart';
import 'package:furniture_shop_app/data/firebase/firestore/firestore_client.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:talker/talker.dart';

class AuthRepository implements AbstractAuthRepository {
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
  Future<UserCredential> signUp(UserModel user) async {
    try {
      final userCredential = await authClient.signUp(
        email: user.email!,
        password: user.password!,
      );
      if (user.displayName != null) {
        await userCredential.user?.updateDisplayName(user.displayName);
      }
      firestoreClient.createCollections(userId: userCredential.user!.uid);
      return userCredential;
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<UserCredential> signIn(UserModel user) async {
    try {
      final userCredential = await authClient.signIn(
        email: user.email!,
        password: user.password!,
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
  Future<void> resetPassword(UserModel user) async {
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
