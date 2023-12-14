import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 263,
            child: const CartBodyWidget(),
          ),
          BlocBuilder<CartBloc, CartState>(
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
                case CartFailed():
                  return const ShimmerBottomWidget();
                case CartLoadedFull():
                  return const LoadedBottomWidget();
              }
            },
          )
        ],
      ),
    );
  }
}
