import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furniture_shop_app/data/firebase/firebase.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

class FavoritesRepository implements AbstractFavoritesRepository {
  const FavoritesRepository({
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
      await firestoreClient.addToFavorites(
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
  Future<void> addAllToCart() async {
    try {
      await firestoreClient.addAllToCart(
        userId: authClient.getUserId,
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
  Future<bool> isFavorite({required String id}) async {
    try {
      final isFavorite = await firestoreClient.isFavorite(
        userId: authClient.getUserId,
        productId: id,
      );
      if (isFavorite) {
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
      await firestoreClient.removeFromFavorites(
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
  Stream<List<ProductPreview>> streamProducts() => firestoreClient
          .streamFavoriteItems(userId: authClient.getUserId)
          .asyncMap((listOfIds) async {
        if (listOfIds.isEmpty) return <ProductPreview>[];
        final favoriteProducts = await dioClient.getProductsByIds(listOfIds);
        return favoriteProducts;
      });
}
