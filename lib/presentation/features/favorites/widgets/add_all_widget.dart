import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';

class AddAllWidget extends StatelessWidget {
  const AddAllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoaded) {
          final favProducts = state.products.map((favPrd) => favPrd.product);
          return BlocBuilder<CartBloc, CartState>(
            buildWhen: (p, c) {
              if (p is CartLoaded && c is CartLoaded) {
                return p.cartProducts.length != c.cartProducts.length;
              }
              return false;
            },
            builder: (context, state) {
              if (state is CartLoaded) {
                final cartProducts = state.cartProducts.map((cp) => cp.product);
                // TODO
                if (favProducts != cartProducts) {
                  return const AddAllButton();
                }
              }
              return const SizedBox.shrink();
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
