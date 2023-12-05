import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = AppFonts.nsBold.copyWith(
      fontSize: 20,
      color: AppColors.blackFont,
    );

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        bool enabled = true;
        double totalPrice = 0;
        if (state is CartLoading) {
          enabled = true;
        } else if (state is CartLoaded) {
          enabled = false;
          totalPrice = state.cartProducts
              .fold(0.0, (pv, cp) => cp.product.price * cp.inCartValue + pv);
        }

        return Shimmer.fromColors(
          baseColor: AppColors.shimmerBase,
          highlightColor: AppColors.shimmerHighlight,
          enabled: enabled,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: enabled ? 20 : 40)
                .copyWith(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (enabled)
                  const Expanded(
                      child: RoundedContainer(
                    borderRadius: 10,
                    height: 25,
                  ))
                else
                  ..._priceWidgets(textStyle, totalPrice),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _priceWidgets(TextStyle textStyle, double totalPrice) {
    return [
      Text(
        'Total:',
        style: AppFonts.nsBold.copyWith(
          fontSize: 20,
          color: AppColors.grey,
        ),
      ),
      Text(
        '\$ ${totalPrice.toStringAsFixed(2)}',
        style: textStyle,
      )
    ];
  }
}
