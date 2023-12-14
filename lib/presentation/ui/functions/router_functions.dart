part of 'functions.dart';

abstract class RouterFunc extends Functions {
  static void popBack(BuildContext context) => context.pop();

  static void goToCart(BuildContext context) => context.push(RoutePaths.cart);

  static void openProduct(BuildContext context, String id) =>
      context.push(RoutePaths.productCard, extra: id);

  static void goToLogin(BuildContext context) => context.go(RoutePaths.auth);
}
