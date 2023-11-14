import 'package:furniture_shop_app/domain/models/models.dart';

abstract class AbstractCartRepository {
  Future<void> changeValue(Product product, bool insrease);
  Future<void> remove(Product product);
  Future<void> add(Product product);
  Future<bool> isInCart(Product product);
  Future<List<Product>> getProducts();
}
