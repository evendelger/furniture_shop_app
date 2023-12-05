import 'dart:convert';

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

  Future<List<ProductPreview>> getProductsByCategory(String category) async {
    try {
      final queryParameters = {
        "category": category,
      };
      final response = await _dio.get(
        Endpoints.products,
        queryParameters: queryParameters,
      );
      final productsListJson = jsonDecode(response.data)['products'] as List;
      final products = productsListJson
          .map((product) => ProductPreview.fromJson(product))
          .toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> getProductById(String id) async {
    try {
      final queryParameters = {"id": id};
      final response =
          await _dio.get(Endpoints.product, queryParameters: queryParameters);
      // получаю List объектов, а не сингл объект, из-за специфики fastgen'а
      final productJson = jsonDecode(response.data)['product'] as List;
      final product = Product.fromJson(productJson[0]);
      return product;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductPreview>> getProductsByIds(Iterable<String> ids) async {
    try {
      final response =
          await _dio.get(Endpoints.productsByIds, queryParameters: {
        "ids": ids.join(','),
      });
      final productListJson = jsonDecode(response.data)['products'] as List;
      final products = productListJson
          .map((prdJson) => ProductPreview.fromJson(prdJson))
          .toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
