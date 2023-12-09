import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class CartBodyWidget extends StatelessWidget {
  const CartBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: BlocBuilder<CartBloc, CartState>(
        buildWhen: (p, c) {
          if (p is CartLoadedFull && c is CartLoadedRaw) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          switch (state) {
            case CartLoadedRaw():
              return const SliverFillRemaining(child: ShimmerProductsList());
            case CartLoading():
              return const SliverFillRemaining(child: ShimmerProductsList());
            case CartLoadedFull():
              return CartProducts(cartProducts: state.cartProducts);
          }
        },
      ),
    );
  }
}
