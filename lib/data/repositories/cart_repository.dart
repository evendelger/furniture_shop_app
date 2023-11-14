import 'package:furniture_shop_app/data/db/db.dart';
import 'package:furniture_shop_app/domain/models/product/product.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

class CartRepository implements AbstractCartRepository {
  const CartRepository({
    required this.database,
  });

  final DbHelper database;

  @override
  Future<void> add(Product product) => database.addToCart(product);

  @override
  Future<void> changeValue(Product product, bool increase) =>
      database.changeValueFromCart(product, increase);

  @override
  Future<bool> isInCart(Product product) => database.isProductInCart(product);

  @override
  Future<void> remove(Product product) => database.removeFromCart(product);

  @override
  Future<List<Product>> getProducts() => database.getProductsFromCart();
}
