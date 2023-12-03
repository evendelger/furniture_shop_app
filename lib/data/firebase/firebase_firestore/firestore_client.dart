import 'package:cloud_firestore/cloud_firestore.dart';

enum CartOperation {
  insert,
  remove,
}

class FirestoreClient {
  FirestoreClient();

  final _firestore = FirebaseFirestore.instance;

  CollectionReference get _cartCollection => _firestore.collection('Cart');

  CollectionReference get _favoritesCollection =>
      _firestore.collection('Favorites');

  Future<bool> isInCart({
    required String userId,
    required String productId,
  }) async {
    try {
      // можно сделать без where - через простой get() по id, но раз в доке указан ТОЛЬКО
      // такой способ, а другого where просто не существует, то использую этот
      _cartCollection.where("items", arrayContains: productId).get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            if (docSnapshot.id == productId) {
              return true;
            }
          }
        },
      );
      return false;
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
        "items": FieldValue.arrayUnion([productId]),
      });
    } catch (e) {
      rethrow;
    }
  }
  // FieldValue.arrayRemove([productId])

  Future<void> removeFromCart({
    required String userId,
    required String productId,
  }) async {
    try {
      // ???
      await _cartCollection.doc(userId).update({
        "items": FieldValue.arrayRemove([{}.remove(productId)])
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addToFavorites() async {}
}
