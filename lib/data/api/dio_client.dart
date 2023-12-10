import 'package:dio/dio.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/data/api/api.dart';
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

  Future<ProductPvList> getProductsByCategory({
    required String category,
  }) async {
    try {
      final queryParameters = {
        "category": category,
      };
      final response = await _dio.get(
        Endpoints.products,
        queryParameters: queryParameters,
      );
      final products = ProductPvList.fromJson(response.data);
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Future<List> _getProductById({
    required String id,
    required bool isPreview,
  }) async {
    try {
      final queryParameters = {
        "id": id,
        "preview": isPreview,
      };
      final response = await _dio.get(
        Endpoints.product,
        queryParameters: queryParameters,
      );
      // получаю List объектов, а не сингл объект, из-за специфики fastgen'а
      final productJson = response.data['product'] as List;
      return productJson;
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> getFullProductById({required String id}) async {
    final productJson = await _getProductById(id: id, isPreview: false);
    final product = Product.fromJson(productJson[0]);
    return product;
  }

  Future<ProductPreview> getProductPreviewById({required String id}) async {
    final productJson = await _getProductById(id: id, isPreview: true);
    final product = ProductPreview.fromJson(productJson[0]);
    return product;
  }

  Future<ProductPvList> getProductsByIds({
    required Iterable<String> ids,
  }) async {
    try {
      final response =
          await _dio.get(Endpoints.productsByIds, queryParameters: {
        "ids": ids.join(','),
      });
      final productsPv = ProductPvList.fromJson(response.data);
      final sortedProducts = ProductPvList(
          products: ids
              .map((id) => productsPv.products.firstWhere((p) => p.id == id))
              .toList());
      // final products = productListJson
      //     .map((prdJson) => ProductPreview.fromJson(prdJson))
      //     .toList();
      // увы, из-за ограниченности бэка данные приходят не в том порядке, поэтому
      // приходится их сортировать
      // final sortedProducts =
      //     ids.map((id) => productsPv.firstWhere((p) => p.id == id)).toList();
      return sortedProducts;
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductPvList> getProductsByName({
    required String name,
  }) async {
    try {
      final response = await _dio.get(Endpoints.search, queryParameters: {
        "name": name,
      });
      final products = response.data['products'] == null
          ? const ProductPvList(products: [])
          : ProductPvList.fromJson(response.data);
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
