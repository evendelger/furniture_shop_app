import 'package:furniture_shop_app/domain/models/models.dart';

abstract class AbstractFavoritesRepository {
  Future<void> add(Product product);
  Future<void> remove(String id);
  Future<void> addAllToCart();
  Future<bool> isFavorite(String id);
  Future<List<Product>> getProducts();
}
