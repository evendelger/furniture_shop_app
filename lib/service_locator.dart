import 'package:dio/dio.dart';
import 'package:furniture_shop_app/data/db/db.dart';
import 'package:furniture_shop_app/data/repositories/repositories.dart';
import 'package:furniture_shop_app/domain/network/network.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> initLocator() async {
    getIt.registerLazySingleton<DioClient>(() => DioClient(dio: Dio()));

    getIt.registerLazySingleton<AbstractProductsRepository>(
      () => ProductsRepository(dioClient: getIt<DioClient>()),
    );

    getIt.registerLazySingleton<AbstractFavoritesRepository>(
      () => FavoritesRepository(database: DbHelper.instance),
    );

    getIt.registerLazySingleton<AbstractCartRepository>(
      () => CartRepository(database: DbHelper.instance),
    );
  }
}
