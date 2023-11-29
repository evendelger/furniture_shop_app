import 'package:furniture_shop_app/data/db/db.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

class CartRepository implements AbstractCartRepository {
  const CartRepository({
    required this.database,
  });

  final DbHelper database;

  @override
  Future<void> add(Product product, int count) =>
      database.addToCart(product, count);

  @override
  Future<void> changeValue(String id, bool increase) =>
      database.changeValueFromCart(id, increase);

  @override
  Future<bool> isInCart(String id) => database.isProductInCart(id);

  @override
  Future<void> remove(String id) => database.removeFromCart(id);

  @override
  Future<List<CartProduct>> getProducts() => database.getProductsFromCart();
}
