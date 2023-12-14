import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class CartBodyWidget extends StatelessWidget {
  const CartBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<CartBloc, CartState>(
        buildWhen: (p, c) {
          if (p is CartLoadedFull && c is CartLoadedRaw) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          switch (state) {
            case CartLoadedRaw():
            case CartLoading():
              return const ShimmerProductsList();
            case CartLoadedFull():
              if (state.cartProducts.isEmpty) {
                return const Center(child: Text('The cart is empty'));
              } else {
                return CartProducts(cartProducts: state.cartProducts);
              }
            case CartFailed():
              return Center(
                child: ErrorMessageWidget(
                  message: state.errorMessage,
                  productsRefreshType: ProductsRefreshType.cart,
                ),
              );
          }
        },
      ),
    );
  }
}
