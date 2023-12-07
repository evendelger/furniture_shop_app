import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/features/product_card/bloc/product_card_bloc.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

// TODO
// ИЗМЕНИТЬ ЭТОТ КОСТЫЛЬ В БУДУЩЕМ
enum BlocType {
  cart,
  productCard,
}

class ChangeCountButton extends StatelessWidget {
  const ChangeCountButton({
    super.key,
    required this.icon,
    required this.increase,
    required this.id,
    required this.blocType,
  });

  final IconData icon;
  final bool increase;
  final String id;
  final BlocType blocType;

  void _changeCount(BuildContext context) {
    switch (blocType) {
      case BlocType.cart:
        context
            .read<CartBloc>()
            .add(ChangeCartValue(id: id, increase: increase));
      case BlocType.productCard:
        context.read<ProductCardBloc>().add(ChangeCount(increment: increase));
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
