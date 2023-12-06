import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 160,
            child: const CustomScrollView(
              shrinkWrap: true,
              slivers: [
                CartAppBar(),
                CartBodyWidget(),
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              switch (state) {
                case CartLoading():
                  return const ShimmerBottomWidget();
                case CartLoaded():
                  return const LoadedBottomWidget();
              }
            },
          )
        ],
      ),
    );
  }
}
