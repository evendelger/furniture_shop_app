import 'package:dio/dio.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/data/api/api.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';

class ProductsRepository implements IProductsRepository {
  const ProductsRepository({required this.dioClient});

  final DioClient dioClient;

  @override
  Future<ProductPvList> getProducts({required String category}) async {
    try {
      final products = await dioClient.getProductsByCategory(
        category: category,
      );
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

  @override
  Future<ProductPvList> getProductsByName({
    required String name,
  }) async {
    try {
      final products = await dioClient.getProductsByName(name: name);
      return products;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).message;
      throw errorMessage;
    }
  }
}
