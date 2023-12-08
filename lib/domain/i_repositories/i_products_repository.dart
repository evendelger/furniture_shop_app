import 'package:furniture_shop_app/domain/models/models.dart';

abstract interface class IProductsRepository {
  Future<List<ProductPreview>> getProducts({required String category});
  Future<Product> getProductById({required String id});
}
