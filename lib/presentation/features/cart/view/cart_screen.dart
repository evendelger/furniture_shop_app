import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';

@RoutePage()
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
                CartProducts(),
              ],
            ),
          ),
          const TotalPriceWidget(),
          const SizedBox(height: 20),
          const CheckOutButton(),
        ],
      ),
    );
  }
}
