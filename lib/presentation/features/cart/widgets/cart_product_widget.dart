import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({
    super.key,
    required this.cartProduct,
  });

  final CartProductPv cartProduct;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () =>
                RouterFunc.openProduct(context, cartProduct.product.id),
            child: RoundedImageWidget(
              imageUrl: cartProduct.product.image,
              widthSize: 100,
            ),
          ),
          const SizedBox(width: 20),
          ProductInfoColumn(
            product: cartProduct.product,
            addition: ProductCountRow(cartProduct: cartProduct),
          ),
          const Spacer(),
          InkWell(
            onTap: () => CartBlocFunc.remove(context, cartProduct.product.id),
            borderRadius: BorderRadius.circular(50),
            child: const CustomIcon(
              iconName: 'close',
              color: AppColors.primary,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
