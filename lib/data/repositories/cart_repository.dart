import 'package:furniture_shop_app/data/firebase/firebase_auth/firebase_auth.dart';
import 'package:furniture_shop_app/data/firebase/firebase_firestore/firestore_client.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:talker/talker.dart';

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
    } catch (e) {
      locator<Talker>().error(e);
      rethrow;
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
    } catch (e) {
      locator<Talker>().error(e);
      rethrow;
    }
  }

  @override
  Future<List<CartProduct>> getProducts() async {
    try {
      // получаю данные о корзине из db
      final cartItems = await firestoreClient.getCartItems(
        userId: authClient.getUserId,
      );
      // получаю список товаров по id
      final products =
          await dioClient.getProductsByIds(cartItems.map((i) => i.id));
      final cartProducts = <CartProduct>[];
      // объединяю данные в модель
      for (int i = 0; i < cartItems.length; i++) {
        cartProducts.add(
          CartProduct(product: products[i], inCartValue: cartItems[i].value),
        );
      }
      return cartProducts;
    } catch (e) {
      locator<Talker>().error(e);
      rethrow;
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
    } catch (e) {
      locator<Talker>().error(e);
      rethrow;
    }
  }

  @override
  Future<void> remove({required String id}) async {
    try {
      firestoreClient.removeFromCart(
        userId: authClient.getUserId,
        productId: id,
      );
    } catch (e) {
      locator<Talker>().error(e);
      rethrow;
    }
  }
}
