import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

class FirestoreClient {
  FirestoreClient();

  final _firestore = FirebaseFirestore.instance;

  CollectionReference get _cartCollection => _firestore.collection('Cart');

  CollectionReference get _favoritesCollection =>
      _firestore.collection('Favorites');

  Future<List<Map<String, dynamic>>> _getRawCartItems(String userId) async {
    final cartItemsJson = await _cartCollection.doc(userId).get();
    return (cartItemsJson.data() as Map)['items'] as List<Map<String, dynamic>>;
  }

  Future<List<CartItem>> getCartItems({required String userId}) async =>
      (await _getRawCartItems(userId))
          .map((cartItem) => CartItem.fromJson(cartItem))
          .toList();

  Future<List<String>> getFavoriteItems({required String userId}) async {
    final favoriteItemsJson = await _favoritesCollection.doc(userId).get();
    return (favoriteItemsJson.data() as Map)['items'] as List<String>;
  }

  Future<void> createCollections({required String userId}) async {
    try {
      _cartCollection.doc(userId).set({
        "items": [],
      });
      _favoritesCollection.doc(userId).set({
        "items": [],
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isFavorite({
    required String userId,
    required String productId,
  }) async {
    try {
      final items = await getFavoriteItems(userId: userId);
      if (items.contains(productId)) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addAllToCart({
    required String userId,
  }) async {
    try {} catch (e) {
      rethrow;
    }
    try {
      final productsId = await getFavoriteItems(userId: userId);
      final listMappedNewItems = List.generate(
        productsId.length,
        (index) => {
          'id': productsId[index],
          'value': 1,
        },
      );
      final userCartRef = _cartCollection.doc(userId);
      userCartRef.update({
        "items": FieldValue.arrayUnion(listMappedNewItems),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addToFavorites({
    required String userId,
    required String productId,
  }) async {
    try {
      _favoritesCollection.doc(userId).update({
        "items": FieldValue.arrayUnion([productId]),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromFavorites({
    required String userId,
    required String productId,
  }) async {
    try {
      _favoritesCollection.doc(userId).update({
        "items": FieldValue.arrayRemove([productId]),
      });
    } catch (e) {
      rethrow;
    }
  }

  // можно сделать без where - через простой get() по id, но раз в доке указан ТОЛЬКО
  // такой способ, а другого where просто не существует, то использую этот
  Future<bool> isInCart({
    required String userId,
    required String productId,
  }) async {
    try {
      final cartItems = await _getRawCartItems(userId);
      for (var item in cartItems) {
        if (item['id'] == productId) {
          return true;
        }
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  // опять же, к сожалению из-за ограничений firebase к редактированию сложных данных
  // имеет смысл только такой сложный способ(другие не работают)
  Future<void> changeInCartValue({
    required String userId,
    required String productId,
    required bool increase,
  }) async {
    try {
      final cartItems = await _getRawCartItems(userId);
      final changedItems = cartItems.map((item) {
        if (item['id'] == productId) {
          final value = item['value'] as int;

          // ignore: unused_local_variable
          int newValue;
          if (!(increase && value == 99 || !increase && value == 1)) {
            newValue = increase ? value + 1 : value - 1;
          }
          return {
            'id': productId,
            'value': (item['value'] as int) + 1,
          };
        }
        return item;
      });
      _cartCollection.doc(userId).update({
        "items": changedItems,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addToCart({
    required String userId,
    required String productId,
  }) async {
    try {
      final userCartRef = _cartCollection.doc(userId);
      userCartRef.update({
        "items": FieldValue.arrayUnion([
          {
            'id': productId,
            'value': 1,
          }
        ]),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromCart({
    required String userId,
    required String productId,
  }) async {
    try {
      final cartItems = await _getRawCartItems(userId);
      cartItems.removeWhere((item) => item['id'] == productId);

      await _cartCollection.doc(userId).set({
        "items": cartItems,
      });
    } catch (e) {
      rethrow;
    }
  }
}
