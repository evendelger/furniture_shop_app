import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/account/account.dart';
import 'package:furniture_shop_app/presentation/features/boarding/boarding.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/features/home/home.dart';
import 'package:furniture_shop_app/presentation/features/login/login.dart';
import 'package:furniture_shop_app/presentation/features/notification/notification.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: BoardingRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          children: [
            AutoRoute(
              page: ProductsRoute.page,
              path: 'products',
            ),
            AutoRoute(
              page: FeaturedRoute.page,
              path: 'favorites',
            ),
            AutoRoute(
              page: NotificationRoute.page,
              path: 'notification',
            ),
            AutoRoute(
              page: AccountRoute.page,
              path: 'account',
            ),
          ],
        ),
        AutoRoute(
          path: '/product_card',
          page: ProductCardRoute.page,
        ),
        CustomRoute(
          path: '/cart',
          page: CartRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
        ),
      ];
}
