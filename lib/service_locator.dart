import 'package:dio/dio.dart';
import 'package:furniture_shop_app/data/repository/products_repository.dart';
import 'package:furniture_shop_app/domain/network/network.dart';
import 'package:furniture_shop_app/domain/repository/abstract_products_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> initLocator() async {
    getIt.registerLazySingleton<DioClient>(() => DioClient(dio: Dio()));

    getIt.registerLazySingleton<AbstractProductsRepository>(
      () => ProductsRepository(dioClient: getIt<DioClient>()),
    );
  }
}
