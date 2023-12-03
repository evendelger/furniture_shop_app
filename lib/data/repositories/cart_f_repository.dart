import 'package:furniture_shop_app/domain/models/product/product.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

class CartFRepository extends AbstractCartFRepository {
  @override
  Future<void> add(String id, int count) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> changeValue(String id, bool increase) {
    // TODO: implement changeValue
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<bool> isInCart(String id) {
    // TODO: implement isInCart
    throw UnimplementedError();
  }

  @override
  Future<void> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
