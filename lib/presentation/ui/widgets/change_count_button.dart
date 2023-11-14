import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

enum BlocType {
  productCard,
  cart,
}

class ChangeCountButton extends StatelessWidget {
  const ChangeCountButton({
    super.key,
    required this.icon,
    required this.increase,
    required this.blocType,
    this.cartProduct,
  });

  final IconData icon;
  final bool increase;
  final BlocType blocType;
  final CartProduct? cartProduct;

  void _changeCount(BuildContext context) {
    switch (blocType) {
      case BlocType.productCard:
        context.read<ProductSelectBloc>().add(ChangeCount(isAdd: increase));
        break;
      case BlocType.cart:
        context.read<CartBloc>().add(ChangeValue(
              cartProduct: cartProduct!,
              increase: increase,
            ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(6);
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: AppColors.iconGreyColor,
      ),
      child: IconButton(
        onPressed: () => _changeCount(context),
        padding: EdgeInsets.zero,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: borderRadius),
          ),
        ),
        icon: Icon(
          icon,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
