import 'package:dio/dio.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/network/network.dart';
import 'package:furniture_shop_app/domain/repository/abstract_products_repository.dart';

class ProductsRepository implements AbstractProductsRepository {
  const ProductsRepository({required this.dioClient});

  final DioClient dioClient;

  @override
  Future<List<Product>> getProducts(String category) async {
    try {
      final products = await dioClient.getProducts(category);
      return products;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}