import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ProductCountRow extends StatelessWidget {
  const ProductCountRow({
    super.key,
    required this.cartProduct,
  });

  final CartProductPv cartProduct;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChangeCountButton(
          icon: Icons.add,
          increase: true,
          id: cartProduct.product.id,
        ),
        const SizedBox(width: 15),
        Text(
          cartProduct.inCartValue.toString().padLeft(2, '0'),
          style: AppFonts.nsSemiBold.copyWith(
            fontSize: 18,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 15),
        ChangeCountButton(
          icon: Icons.remove,
          increase: false,
          id: cartProduct.product.id,
        ),
      ],
    );
  }
}
