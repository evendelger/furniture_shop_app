// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    BoardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BoardingScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    FeaturedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeaturedScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationScreen(),
      );
    },
    ProductCardRoute.name: (routeData) {
      final args = routeData.argsAs<ProductCardRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductCardScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductsScreen(),
      );
    },
  };
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BoardingScreen]
class BoardingRoute extends PageRouteInfo<void> {
  const BoardingRoute({List<PageRouteInfo>? children})
      : super(
          BoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'BoardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeaturedScreen]
class FeaturedRoute extends PageRouteInfo<void> {
  const FeaturedRoute({List<PageRouteInfo>? children})
      : super(
          FeaturedRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeaturedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductCardScreen]
class ProductCardRoute extends PageRouteInfo<ProductCardRouteArgs> {
  ProductCardRoute({
    Key? key,
    required Product product,
    List<PageRouteInfo>? children,
  }) : super(
          ProductCardRoute.name,
          args: ProductCardRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductCardRoute';

  static const PageInfo<ProductCardRouteArgs> page =
      PageInfo<ProductCardRouteArgs>(name);
}

class ProductCardRouteArgs {
  const ProductCardRouteArgs({
    this.key,
    required this.product,
  });

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'ProductCardRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [ProductsScreen]
class ProductsRoute extends PageRouteInfo<void> {
  const ProductsRoute({List<PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
