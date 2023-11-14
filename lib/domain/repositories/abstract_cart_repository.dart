import 'package:furniture_shop_app/domain/models/models.dart';

abstract class AbstractCartRepository {
  Future<void> changeValue(String id, bool insrease);
  Future<void> remove(String id);
  Future<void> add(Product product, int count);
  Future<bool> isInCart(String id);
  Future<List<CartProduct>> getProducts();
}
