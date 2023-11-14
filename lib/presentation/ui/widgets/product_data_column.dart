import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class ProductDataColumn extends StatelessWidget {
  const ProductDataColumn({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: AppFonts.nsSemiBold.copyWith(
            color: AppColors.black3,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '\$ ${product.price}0',
          style: AppFonts.nsBold.copyWith(
            color: AppColors.blackFont,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
