import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/features/home/home.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/service_locator.dart';

class FurnitureStoreApp extends StatelessWidget {
  FurnitureStoreApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(
            repository: getIt<AbstractProductsRepository>(),
          )..add(LoadProducts(category: categoriesList[0])),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc(),
        ),
        BlocProvider(
          create: (context) => FavoritesBloc(
            repository: getIt<AbstractFavoritesRepository>(),
          )..add(const FetchFavorites()),
        ),
        BlocProvider(
          create: (context) => CartBloc(
            repository: getIt<AbstractCartRepository>(),
          )..add(const FetchCart()),
        ),
      ],
      child: MaterialApp.router(
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(
          navigatorObservers: () => [AutoRouteObserver()],
        ),
      ),
    );
  }
}
