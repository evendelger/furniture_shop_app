import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/account/account.dart';
import 'package:furniture_shop_app/presentation/features/boarding/boarding.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/features/home/home.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:furniture_shop_app/presentation/features/loading/loading.dart';
import 'package:furniture_shop_app/presentation/features/notification/notification.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:talker/talker.dart';

class AppRouter {
  static final _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static GoRouter get router => _router;

  static final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.loading,
    routes: [
      GoRoute(
        path: Routes.loading,
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: Routes.boarding,
        builder: (context, state) => const BoardingScreen(),
        routes: [
          GoRoute(
            path: Routes.auth,
            name: RouteNames.auth,
            builder: (context, state) => const AuthScreen(),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeScreenNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.products,
                builder: (context, state) => const ProductsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.favorites,
                builder: (context, state) => const FavoritesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.notification,
                builder: (context, state) => const NotificationScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.account,
                builder: (context, state) => const AccountScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.cart,
        name: Routes.cart,
        pageBuilder: (context, state) =>
            RightSlideTransition(child: const CartScreen()),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: Routes.productCard,
        name: Routes.productCard,
        // builder: (context, state) => ProductCardScreen(
        //   product: state.extra as Product,
        // ),
        pageBuilder: (context, state) => CustomScaleTransition(
          child: ProductCardScreen(
            product: state.extra as Product,
          ),
        ),
      ),
    ],
    refreshListenable: AuthBlocListenable(),
    redirect: (context, state) async {
      final authBlocState = locator<AuthBloc>().state;
      final onAuthPage = state.fullPath!.contains(Routes.auth);
      final onLoadingPage = state.fullPath! == Routes.loading;

      Talker().debug('NEW PATH - ${state.fullPath}');

      if (authBlocState is AuthInitial && !onAuthPage) {
        return Routes.boarding;
      }
      if (authBlocState is AuthSuccess) {
        if (onAuthPage || onLoadingPage) {
          return Routes.products;
        }
      }

      return null;
    },
  );
}
