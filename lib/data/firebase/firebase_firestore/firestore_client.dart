import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

class FirestoreClient {
  FirestoreClient();

  final _firestore = FirebaseFirestore.instance;

  CollectionReference get _cartRef => _firestore.collection('Cart');

  CollectionReference get _favoritesRef => _firestore.collection('Favorites');

  Future<List> _getRawCartItems(String userId) async {
    final cartItemsJson = await _cartRef.doc(userId).get();
    return (cartItemsJson.data() as Map)['items'] as List; //
  }

  Future<List> _getRawFavoriteItems({required String userId}) async {
    final favoriteItemsJson = await _favoritesRef.doc(userId).get();
    return (favoriteItemsJson.data() as Map)['items'] as List;
  }

  // Future<List<CartItem>> getCartItems({required String userId}) async {
  //   final rawItems = await _getRawCartItems(userId);
  //   if (rawItems.isEmpty) return <CartItem>[];
  //   return rawItems.map((cartItem) => CartItem.fromJson(cartItem)).toList();
  // }

  Future<List<String>> _getFavoriteItems({required String userId}) async {
    final rawItems = await _getRawFavoriteItems(userId: userId);
    if (rawItems.isEmpty) return <String>[];
    return rawItems as List<String>;
  }

  /////////////////////////////////////////////

  Stream<List<String>> streamFavoriteItems({required String userId}) =>
      _favoritesRef.doc(userId).snapshots().map((snapshot) {
        final listOfItems = (snapshot.data() as Map)['items'] as List;
        if (listOfItems.isEmpty) return <String>[];
        return listOfItems as List<String>;
      });

  Stream<List<CartItem>> streamCartItems({required String userId}) =>
      _cartRef.doc(userId).snapshots().map((snapshot) {
        final listOfItems = (snapshot.data() as Map)['items'] as List;
        if (listOfItems.isEmpty) return <CartItem>[];
        return listOfItems
            .map((cartItem) => CartItem.fromJson(cartItem))
            .toList();
      });

  /////////////////////////////////////////////

  Future<void> createCollections({required String userId}) async {
    try {
      _cartRef.doc(userId).set({
        "items": [],
      });
      _favoritesRef.doc(userId).set({
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
      final items = await _getFavoriteItems(userId: userId);
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
    try {
      final productsId = await _getFavoriteItems(userId: userId);
      final listMappedNewItems = List.generate(
        productsId.length,
        (index) => {
          'id': productsId[index],
          'value': 1,
        },
      );
      final userCartRef = _cartRef.doc(userId);
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
      _favoritesRef.doc(userId).update({
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
      _favoritesRef.doc(userId).update({
        "items": FieldValue.arrayRemove([productId]),
      });
    } catch (e) {
      rethrow;
    }
  }

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
      _cartRef.doc(userId).update({
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
      final userCartRef = _cartRef.doc(userId);
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

      await _cartRef.doc(userId).set({
        "items": cartItems,
      });
    } catch (e) {
      rethrow;
    }
  }
}
