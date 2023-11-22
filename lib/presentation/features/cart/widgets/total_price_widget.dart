import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total:',
            style: AppFonts.nsBold.copyWith(
              fontSize: 20,
              color: AppColors.grey,
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoaded) {
                final totalPrice = state.cartProducts.fold(
                    0.0, (pv, cp) => cp.product.price * cp.inCartValue + pv);
                return Text(
                  '\$ ${totalPrice.toStringAsFixed(2)}',
                  style: AppFonts.nsBold.copyWith(
                    fontSize: 20,
                    color: AppColors.blackFont,
                  ),
                );
              }
              return const SizedBox.expand();
            },
          )
        ],
      ),
    );
  }
}
