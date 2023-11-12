import 'package:flutter/widgets.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ ${price}0',
      style: AppFonts.nsBold.copyWith(
        fontSize: 30,
        color: AppColors.blackFont,
      ),
    );
  }
}
