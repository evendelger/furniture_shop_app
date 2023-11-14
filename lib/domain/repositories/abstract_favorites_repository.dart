import 'package:furniture_shop_app/domain/models/models.dart';

abstract class AbstractFavoritesRepository {
  Future<void> add(Product product);
  Future<void> remove(Product product);
  Future<void> addAllToCart();
  Future<bool> isFavorite(Product product);
  Future<List<Product>> getProducts();
}
