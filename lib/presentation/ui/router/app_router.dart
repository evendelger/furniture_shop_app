import 'package:flutter/material.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/profile/profile.dart';
import 'package:furniture_shop_app/presentation/features/boarding/boarding.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/features/home/home.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:furniture_shop_app/presentation/features/notification/notification.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'root',
  );

  static GoRouter get router => _router;

  static final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.initial,
    routes: [
      // GoRoute(
      //   path: RoutePaths.initial,
      //   builder: (context, state) => const LoadingScreen(),
      // ),
      GoRoute(
        path: RoutePaths.initial,
        builder: (context, state) => const BoardingScreen(),
      ),
      GoRoute(
        path: RoutePaths.auth,
        builder: (context, state) => const AuthScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeScreenNavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.products,
                builder: (context, state) => const ProductsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: RoutePaths.favorites,
                  builder: (context, state) {
                    FavBlocFunc.fetch(context, false);
                    return const FavoritesScreen();
                  }),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.notification,
                builder: (context, state) => const NotificationScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: RoutePaths.cart,
          pageBuilder: (context, state) {
            // преобразовываю данные при открытии корзины
            // CartBlocFunc.updateState(context);
            return RightSlideTransition(child: const CartScreen());
          }),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: RoutePaths.productCard,
        pageBuilder: (context, state) => CustomFadeTransition(
          child: ProductCardScreen(id: state.extra as String),
        ),
      ),
    ],
    refreshListenable: AuthBlocListenable(),
    redirect: (context, state) async {
      final authBlocState = locator<AuthBloc>().state;
      final onAuthPage = state.fullPath!.contains(RoutePaths.auth);
      final onInitialPage = state.fullPath! == RoutePaths.initial;

      if (authBlocState is AuthInitial && !onAuthPage) {
        return RoutePaths.initial;
      }
      if (authBlocState is AuthSuccess) {
        if (onAuthPage || onInitialPage) {
          return RoutePaths.products;
        }
      }

      return null;
    },
  );
}
