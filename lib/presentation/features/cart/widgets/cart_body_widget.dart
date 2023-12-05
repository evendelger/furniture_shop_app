import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class CartBodyWidget extends StatelessWidget {
  const CartBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      sliver: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          switch (state) {
            case CartLoading():
              return const SliverFillRemaining(
                child: ShimmerProductsList(),
              );
            case CartLoaded():
              return CartProducts(cartProducts: state.cartProducts);
          }
        },
      ),
    );
  }
}
