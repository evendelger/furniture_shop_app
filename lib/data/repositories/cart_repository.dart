import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furniture_shop_app/data/firebase/firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/data/firebase/firebase_firestore/firestore_client.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

class CartRepository implements AbstractCartRepository {
  const CartRepository({
    required this.authClient,
    required this.firestoreClient,
    required this.dioClient,
  });

  final AuthClient authClient;
  final FirestoreClient firestoreClient;
  final DioClient dioClient;

  @override
  Future<void> add({required String id}) async {
    try {
      firestoreClient.addToCart(userId: authClient.getUserId, productId: id);
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<void> changeValue({required String id, required bool increase}) async {
    try {
      firestoreClient.changeInCartValue(
        userId: authClient.getUserId,
        productId: id,
        increase: increase,
      );
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<bool> isInCart({required String id}) async {
    try {
      final isInCart = await firestoreClient.isInCart(
        userId: authClient.getUserId,
        productId: id,
      );
      if (isInCart) {
        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<void> remove({required String id}) async {
    try {
      firestoreClient.removeFromCart(
        userId: authClient.getUserId,
        productId: id,
      );
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).message;
      throw errorMessage;
    }
  }

  @override
  Stream<List<CartProduct>> streamProducts() =>
      firestoreClient.streamCartItems(userId: authClient.getUserId).asyncMap(
        (cartItems) async {
          if (cartItems.isEmpty) return <CartProduct>[];
          final products = await dioClient.getProductsByIds(
            cartItems.map((i) => i.id),
          );
          return List<CartProduct>.generate(
            products.length,
            (i) => CartProduct(
              product: products[i],
              inCartValue: cartItems[i].value,
            ),
          );
        },
      );
}
