import 'package:furniture_shop_app/domain/models/models.dart';

abstract interface class IProductsRepository {
  Future<ProductPvList> getProducts({required String category});
  Future<Product> getProductById({required String id});
  Future<ProductPvList> getProductsByName({required String name});
}
