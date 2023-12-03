import 'package:dio/dio.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

class ProductsRepository implements AbstractProductsRepository {
  const ProductsRepository({required this.dioClient});

  final DioClient dioClient;

  @override
  Future<List<Product>> getProducts(String category) async {
    try {
      final products = await dioClient.getProductsByCategory(category);
      return products;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<Product> getProductById(String id) async {
    try {
      final product = await dioClient.getProductById(id);
      return product;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).message;
      throw errorMessage;
    }
  }
}
