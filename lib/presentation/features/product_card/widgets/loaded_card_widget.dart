import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';

class LoadedCardWidget extends StatelessWidget {
  const LoadedCardWidget({
    super.key,
    required this.state,
  });

  final ProductCardLoaded state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProductInfo(state: state),
        Positioned(
          left: 25,
          right: 25,
          bottom: 30,
          child: ActionButtons(state: state),
        ),
      ],
    );
  }
}
