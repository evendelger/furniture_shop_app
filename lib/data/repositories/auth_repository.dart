import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/data/firebase/firebase_auth/firebase_auth_client.dart';
import 'package:furniture_shop_app/data/firebase/firebase_auth/firebase_exceptions.dart';
import 'package:furniture_shop_app/data/firebase/firebase_firestore/firestore_client.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:talker/talker.dart';

class AuthRepository implements AbstractAuthRepository {
  const AuthRepository({
    required this.firestoreClient,
    required this.firebaseClient,
  });

  final AuthClient firebaseClient;
  final FirestoreClient firestoreClient;

  @override
  Stream<UserModel> getUserStream() => firebaseClient.retrieveCurrentUser();

  @override
  Future<bool> isSignedIn() async {
    final user = await firebaseClient.retrieveCurrentUser().first;
    Talker().log(user);
    return user.isAuthorized;
  }

  @override
  Future<UserCredential> signUp(UserModel user) async {
    try {
      final userCredential = await firebaseClient.signUp(
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
      final userCredential = await firebaseClient.signIn(
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
  Future<void> signOut() async => await firebaseClient.signOut();

  @override
  Future<void> resetPassword(UserModel user) async {
    try {
      await firebaseClient.resetPassword(email: user.email!);
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<UserCredential> signInAnonymously() async {
    try {
      final userCredential = await firebaseClient.signInAnonymous();
      firestoreClient.createCollections(userId: userCredential.user!.uid);
      return userCredential;
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }
}
