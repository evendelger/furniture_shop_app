import 'package:auto_route/auto_route.dart';
import 'package:furniture_shop_app/presentation/features/account/account.dart';
import 'package:furniture_shop_app/presentation/features/featured/featured.dart';
import 'package:furniture_shop_app/presentation/features/home/home.dart';
import 'package:furniture_shop_app/presentation/features/notifications/notifications.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: ProductsRoute.page,
              path: 'products',
            ),
            AutoRoute(
              page: FeaturedRoute.page,
              path: 'featured',
            ),
            AutoRoute(
              page: NotificationsRoute.page,
              path: 'notifications',
            ),
            AutoRoute(
              page: AccountRoute.page,
              path: 'account',
            ),
          ],
        ),
      ];
}
