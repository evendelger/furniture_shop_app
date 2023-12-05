import 'package:furniture_shop_app/data/firebase/firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/data/firebase/firebase_firestore/firestore_client.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:talker/talker.dart';

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
      firestoreClient.addToFavorites(
        userId: authClient.getUserId,
        productId: id,
      );
    } catch (e) {
      locator<Talker>().error(e);
      rethrow;
    }
  }

  @override
  Future<void> addAllToCart() async {
    try {
      firestoreClient.addAllToCart(
        userId: authClient.getUserId,
      );
    } catch (e) {
      locator<Talker>().error(e);
      rethrow;
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
    } catch (e) {
      locator<Talker>().error(e);
      rethrow;
    }
  }

  @override
  Future<void> remove({required String id}) async {
    try {
      firestoreClient.removeFromFavorites(
        userId: authClient.getUserId,
        productId: id,
      );
    } catch (e) {
      locator<Talker>().error(e);
      rethrow;
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
