import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({
    super.key,
    required this.cartProduct,
  });

  final CartProduct cartProduct;

  void _openProduct(BuildContext context) {
    context.router.push(ProductCardRoute(product: cartProduct.product));
  }

  void _removeProduct(BuildContext context) {
    context
        .read<CartBloc>()
        .add(ChangeCartStatus(product: cartProduct.product));
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _openProduct(context),
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
            onTap: () => _removeProduct(context),
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
