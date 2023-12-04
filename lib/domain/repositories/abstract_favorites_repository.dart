import 'package:furniture_shop_app/domain/models/models.dart';

abstract class AbstractFavoritesRepository {
  Future<void> add({required String id});
  Future<void> remove({required String id});
  Future<void> addAllToCart();
  Future<bool> isFavorite({required String id});
  Future<List<Product>> getProducts();
}
