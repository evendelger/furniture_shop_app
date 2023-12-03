import 'package:dio/dio.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioClient {
  DioClient({required Dio dio}) {
    _dio = dio
      ..options.baseUrl = Endpoints.baseUrl
      ..interceptors.add(TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printResponseData: false,
        ),
      ));
  }

  late final Dio _dio;

  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final queryParameters = {
        "category": category,
      };
      final response =
          await _dio.get('/products', queryParameters: queryParameters);
      final productsListJson =
          response.data['products'] as List<Map<String, dynamic>>;
      final products =
          productsListJson.map((product) => Product.fromJson(product)).toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> getProductById(String id) async {
    try {
      final queryParameters = {
        "id": id,
      };
      final response =
          await _dio.get('/product', queryParameters: queryParameters);
      // получаю List объектов, а не сингл объект, из-за специфики fastgen'а
      final productJson =
          response.data['product'] as List<Map<String, dynamic>>;
      final product = Product.fromJson(productJson[0]);
      return product;
    } catch (e) {
      rethrow;
    }
  }
}
