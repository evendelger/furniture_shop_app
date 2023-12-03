import 'package:furniture_shop_app/domain/models/models.dart';

abstract class AbstractCartFRepository {
  Future<void> changeValue(String id, bool increase);
  Future<void> remove(String id);
  Future<void> add(String id, int count);
  Future<bool> isInCart(String id);
  Future<List<Product>> getProducts();
}
