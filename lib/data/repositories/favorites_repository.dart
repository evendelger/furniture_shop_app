import 'package:furniture_shop_app/data/db/db.dart';
import 'package:furniture_shop_app/domain/models/product/product.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

class FavoritesRepository implements AbstractFavoritesRepository {
  const FavoritesRepository({
    required this.database,
  });

  final DbHelper database;

  @override
  Future<void> add(Product product) => database.addToFavorites(product);

  @override
  Future<void> addAllToCart() => database.addAllFavoritesToCart();

  @override
  Future<bool> isFavorite(String id) => database.isProductInFavorites(id);

  @override
  Future<void> remove(String id) => database.removeFromFavorites(id);

  @override
  Future<List<Product>> getProducts() => database.getProductsFromFavorites();
}
