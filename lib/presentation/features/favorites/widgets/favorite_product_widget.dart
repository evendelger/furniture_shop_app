import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class FavoriteProductWidget extends StatelessWidget {
  const FavoriteProductWidget({
    super.key,
    required this.favProduct,
  });

  final FavoriteProduct favProduct;

  @override
  Widget build(BuildContext context) {
    final isInCart = favProduct.isInCart;

    return IntrinsicHeight(
      child: Row(
        children: [
          InkWell(
            onTap: () => RouterFunc.openProduct(context, favProduct.product.id),
            child: RoundedImageWidget(
              imageUrl: favProduct.product.image,
              widthSize: 100,
            ),
          ),
          const SizedBox(width: 20),
          ProductInfoColumn(product: favProduct.product),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => FavBlocFunc.remove(context, favProduct.product.id),
                borderRadius: BorderRadius.circular(50),
                child: const CustomIcon(
                  iconName: 'close',
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              CustomSquareButton(
                onPressed: () =>
                    FavBlocFunc.changeCartStatus(context, favProduct),
                backgroundColor:
                    isInCart ? AppColors.iconGreyColor : AppColors.black3,
                iconColor: isInCart ? AppColors.primary : AppColors.white,
                sideLength: 34,
                iconName: 'shopping_bag',
                iconLength: 20,
                borderRadius: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
