import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({
    super.key,
    required this.cartProducts,
  });

  final List<CartProduct> cartProducts;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) =>
          CartProductWidget(cartProduct: cartProducts[index])
              .animate()
              .fadeIn(duration: 500.ms),
      separatorBuilder: (_, __) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Divider(),
      ),
    );
  }
}
