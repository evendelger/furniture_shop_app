part of 'functions.dart';

abstract class RouterFunc extends Functions {
  static void popBack(BuildContext context) => context.pop();

  static void goToCart(BuildContext context) => context.push(Routes.cart);

  static void openProduct(BuildContext context, String id) =>
      context.push(Routes.productCard, extra: id);

  static void goToLogin(BuildContext context) =>
      context.goNamed(RouteNames.auth);
}
