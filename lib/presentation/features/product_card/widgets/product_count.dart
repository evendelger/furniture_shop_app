import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({
    super.key,
    required this.id,
    required this.inCartProduct,
  });

  final String id;
  final int inCartProduct;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChangeCountButton(
          icon: Icons.add,
          increase: true,
          id: id,
          blocType: BlocType.productCard,
        ),
        const SizedBox(width: 15),
        Text(
          inCartProduct.toString().padLeft(2, '0'),
          style: AppFonts.nsSemiBold.copyWith(
            fontSize: 18,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 15),
        ChangeCountButton(
          icon: Icons.remove,
          increase: false,
          id: id,
          blocType: BlocType.productCard,
        ),
      ],
    );
  }
}
