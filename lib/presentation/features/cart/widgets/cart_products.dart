import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      sliver: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          switch (state) {
            case CartLoading():
              return const SliverFillRemaining(
                child: CircularIndicator(),
              );
            case CartLoaded():
              return CartList(cartProducts: state.cartProducts);
          }
        },
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({
    super.key,
    required this.cartProducts,
  });

  final List<CartProduct> cartProducts;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) =>
          CartProductWidget(cartProduct: cartProducts[index]),
      separatorBuilder: (_, __) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Divider(),
      ),
    );
  }
}
