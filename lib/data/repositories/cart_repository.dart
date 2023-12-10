import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furniture_shop_app/data/firebase/firebase.dart';
import 'package:furniture_shop_app/data/api/api.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:talker/talker.dart';

class CartRepository implements ICartRepository {
  CartRepository({
    required this.authClient,
    required this.firestoreClient,
    required this.dioClient,
  }) {
    locator<Talker>().debug('INITIALIZED CART REPO');
    _cartStreamController = StreamController<List<CartItem>>.broadcast()
      ..addStream(_streamProducts());

    // добавляю подписку на последний event, чтобы использовать его в favorites bloc'е
    _lastEventSub =
        _cartStreamController.stream.listen((event) => _lastEvent = event);
  }

  final AuthClient authClient;
  final FirestoreClient firestoreClient;
  final DioClient dioClient;

  // создаю контроллер здесь, поскольку при создании StreamSubscription в блоках
  // стримы посылают snapshot'ы по 2 раза за 1 действие, а решения к этому ПРОСТО НЕТ
  late final StreamController<List<CartItem>> _cartStreamController;
  late final StreamSubscription<List<CartItem>> _lastEventSub;

  @override
  Stream<List<CartItem>> get cartStream => _cartStreamController.stream;

  List<CartItem>? _lastEvent;

  @override
  List<CartItem>? get lastStreamEvent => _lastEvent;

  @override
  Future<void> add({required String id}) async {
    try {
      await firestoreClient.addToCart(
          userId: authClient.getUserId, productId: id);
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<bool> changeValue({required String id, required bool increase}) async {
    try {
      final isChanged = await firestoreClient.changeInCartValue(
        userId: authClient.getUserId,
        productId: id,
        increase: increase,
      );
      return isChanged;
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
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
    }
  }

  @override
  Future<void> remove({required String id}) async {
    try {
      await firestoreClient.removeFromCart(
        userId: authClient.getUserId,
        productId: id,
      );
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<List<CartProductPv>> convertRawItems(List<CartItem> cartItems) async {
    if (cartItems.isEmpty) return <CartProductPv>[];
    final productsPv = await dioClient.getProductsByIds(
      ids: cartItems.map((i) => i.id),
    );
    return List<CartProductPv>.generate(
      productsPv.products.length,
      (i) => CartProductPv(
        product: productsPv.products[i],
        inCartValue: cartItems[i].value!,
      ),
    );
  }

  Stream<List<CartItem>> _streamProducts() =>
      firestoreClient.streamCartItems(userId: authClient.getUserId);

  @override
  Future<CartProductFl> getCartProduct({required String id}) async {
    try {
      final cartItem = await firestoreClient.getCartItem(
        userId: authClient.getUserId,
        productId: id,
      );

      final cartProduct = await dioClient.getFullProductById(id: id);
      return CartProductFl(
        product: cartProduct,
        inCartValue: cartItem == null ? 0 : cartItem.value!,
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
  void dispose() {
    _lastEventSub.cancel();
    _cartStreamController.close();
  }
}
