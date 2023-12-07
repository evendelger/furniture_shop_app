import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/data/firebase/auth/auth_client.dart';
import 'package:furniture_shop_app/data/repositories/repositories.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:furniture_shop_app/firebase_options.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';

import 'data/firebase/firestore/firestore_client.dart';

final locator = GetIt.instance;

abstract class Locator {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebase();
    _initTalker();
    _initApiClient();
    _initRepositories();
    _initBlocs();
    _initBlocObserver();
  }

  static Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    locator.registerSingleton<AuthClient>(
      AuthClient(),
    );
    locator.registerLazySingleton<FirestoreClient>(
      () => FirestoreClient(),
    );
  }

  static void _initApiClient() =>
      locator.registerLazySingleton<DioClient>(() => DioClient(dio: Dio()));

  static void _initRepositories() {
    locator.registerLazySingleton<AbstractAuthRepository>(
      () => AuthRepository(
        authClient: locator<AuthClient>(),
        firestoreClient: locator<FirestoreClient>(),
      ),
    );

    locator.registerLazySingleton<AbstractProductsRepository>(
      () => ProductsRepository(dioClient: locator<DioClient>()),
    );

    locator.registerLazySingleton<AbstractFavoritesRepository>(
      () => FavoritesRepository(
          authClient: locator<AuthClient>(),
          firestoreClient: locator<FirestoreClient>(),
          dioClient: locator<DioClient>()),
      dispose: (_) => locator<FavoritesRepository>().dispose(),
    );

    locator.registerLazySingleton<AbstractCartRepository>(
      () => CartRepository(
        authClient: locator<AuthClient>(),
        firestoreClient: locator<FirestoreClient>(),
        dioClient: locator<DioClient>(),
      ),
      dispose: (_) => locator<AbstractCartRepository>().dispose(),
    );
  }

  static void _initBlocs() {
    locator.registerLazySingleton<AuthBloc>(
      () => AuthBloc(authRepository: locator<AbstractAuthRepository>()),
    );
  }

  static void _initTalker() => locator.registerSingleton<Talker>(Talker());

  static void _initBlocObserver() => Bloc.observer = TalkerBlocObserver(
        settings: const TalkerBlocLoggerSettings(
            // printChanges: true,
            ),
      );
}
