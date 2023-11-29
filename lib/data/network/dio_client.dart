import 'package:dio/dio.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioClient {
  DioClient({required Dio dio}) {
    _dio = dio
      ..options.baseUrl = Endpoints.baseUrl
      ..interceptors.add(TalkerDioLogger());
  }

  late final Dio _dio;

  Future<List<Product>> getProducts(String category) async {
    try {
      final queryCategory = category == 'popular' ? category : '${category}s';
      final response = await _dio.get('/$queryCategory');
      final productListJson = response.data[queryCategory] as List;
      final products =
          productListJson.map((product) => Product.fromJson(product)).toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
