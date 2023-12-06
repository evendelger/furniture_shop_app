import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';

class LoadedBottomWidget extends StatelessWidget {
  const LoadedBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TotalPriceWidget(),
        SizedBox(height: 20),
        CheckOutButton(),
      ],
    );
  }
}
