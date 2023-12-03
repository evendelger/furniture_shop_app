import 'package:furniture_shop_app/domain/models/models.dart';

abstract class AbstractProductsRepository {
  Future<List<Product>> getProducts(String category);
  Future<Product> getProductById(String id);
}
