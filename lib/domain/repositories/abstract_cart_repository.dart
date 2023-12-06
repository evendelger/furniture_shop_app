import 'package:furniture_shop_app/domain/models/models.dart';

abstract class AbstractCartRepository {
  // беру каждый раз uid, поскольку пользователь может перелогиниться, а id
  // останется прежним поскольку AuthClient - синглтон
  Future<bool> changeValue({required String id, required bool increase});
  Future<void> remove({required String id});
  Future<void> add({required String id});
  Future<bool> isInCart({required String id});
  Future<CartProductFl> getCartProduct({required String id});
  Stream<List<CartProductPv>> streamProducts();
}
