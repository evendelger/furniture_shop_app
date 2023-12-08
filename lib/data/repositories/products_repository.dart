import 'package:dio/dio.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:furniture_shop_app/domain/i_repositories/repositories.dart';

class ProductsRepository implements IProductsRepository {
  const ProductsRepository({required this.dioClient});

  final DioClient dioClient;

  @override
  Future<List<ProductPreview>> getProducts({required String category}) async {
    try {
      final products = await dioClient.getProductsByCategory(category);
      return products;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<Product> getProductById({required String id}) async {
    try {
      final product = await dioClient.getFullProductById(id: id);
      return product;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).message;
      throw errorMessage;
    }
  }
}
