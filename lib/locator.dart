import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/data/db/db.dart';
import 'package:furniture_shop_app/data/firebase/firebase_client.dart';
import 'package:furniture_shop_app/data/repositories/repositories.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:furniture_shop_app/firebase_options.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';

final locator = GetIt.instance;

abstract class Locator {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebase();
    _initApiClient();
    _initRepositories();
    _initBlocs();
    _initBlocObserver();
    _initTalker();
  }

  static Future<void> _initFirebase() async => await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

  static void _initApiClient() =>
      locator.registerLazySingleton<DioClient>(() => DioClient(dio: Dio()));

  static void _initRepositories() {
    locator.registerSingleton<AbstractAuthRepository>(
      AuthRepository(firebaseClient: FirebaseClient()),
    );

    locator.registerLazySingleton<AbstractProductsRepository>(
      () => ProductsRepository(dioClient: locator<DioClient>()),
    );

    locator.registerLazySingleton<AbstractFavoritesRepository>(
      () => FavoritesRepository(database: DbHelper.instance),
    );

    locator.registerLazySingleton<AbstractCartRepository>(
      () => CartRepository(database: DbHelper.instance),
    );
  }

  static void _initBlocs() async {
    locator.registerLazySingleton<AuthBloc>(
      () => AuthBloc(authRepository: locator<AbstractAuthRepository>()),
    );
  }

  static void _initTalker() =>
      locator.registerLazySingleton<Talker>(() => Talker());

  static void _initBlocObserver() => Bloc.observer = TalkerBlocObserver(
        settings: const TalkerBlocLoggerSettings(
          printChanges: true,
        ),
      );
}
