import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/data/firebase/firebase.dart';
import 'package:furniture_shop_app/data/repositories/repositories.dart';
import 'package:furniture_shop_app/data/network/network.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/firebase_options.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';

import 'data/permission_client/permission_client.dart';

final locator = GetIt.instance;

abstract class Locator {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initFirebase();
    _initTalker();
    _initClients();
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
      () => const FirestoreClient(),
    );
    locator.registerLazySingleton<StorageClient>(
      () => const StorageClient(),
    );
  }

  static void _initClients() {
    locator.registerLazySingleton<DioClient>(
      () => DioClient(dio: Dio()),
    );
    locator.registerLazySingleton<PermissionClient>(
      () => const PermissionClient(),
    );
  }

  static void _initRepositories() {
    locator.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(
        authClient: locator<AuthClient>(),
        firestoreClient: locator<FirestoreClient>(),
      ),
    );

    locator.registerLazySingleton<IProductsRepository>(
      () => ProductsRepository(dioClient: locator<DioClient>()),
    );

    locator.registerLazySingleton<IFavoritesRepository>(
      () => FavoritesRepository(
          authClient: locator<AuthClient>(),
          firestoreClient: locator<FirestoreClient>(),
          dioClient: locator<DioClient>()),
      dispose: (_) => locator<FavoritesRepository>().dispose(),
    );

    locator.registerLazySingleton<ICartRepository>(
      () => CartRepository(
        authClient: locator<AuthClient>(),
        firestoreClient: locator<FirestoreClient>(),
        dioClient: locator<DioClient>(),
      ),
      dispose: (_) => locator<ICartRepository>().dispose(),
    );

    locator.registerLazySingleton<IProfileRepository>(
      () => ProfileRepository(
        permissionClient: locator<PermissionClient>(),
        storageClient: locator<StorageClient>(),
        authClient: locator<AuthClient>(),
      ),
    );
  }

  static void _initBlocs() {
    locator.registerLazySingleton<AuthBloc>(
      () => AuthBloc(authRepository: locator<IAuthRepository>())
        ..add(const AuthFetchStatus()),
    );
  }

  static void _initTalker() => locator.registerSingleton<Talker>(Talker());

  static void _initBlocObserver() => Bloc.observer = TalkerBlocObserver(
        settings: const TalkerBlocLoggerSettings(
            // printChanges: true,
            ),
      );
}
