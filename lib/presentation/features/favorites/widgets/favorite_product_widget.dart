import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class FavoriteProductWidget extends StatelessWidget {
  const FavoriteProductWidget({
    super.key,
    required this.favProduct,
  });

  final FavoriteProduct favProduct;

  void _remove(BuildContext context) => context
      .read<FavoritesBloc>()
      .add(RemoveFavoriteProduct(id: favProduct.product.id));

  void _openProduct(BuildContext context) =>
      context.push(Routes.productCard, extra: favProduct.product.id);

  void _changeCartStatus(BuildContext context) {
    if (favProduct.isInCart) {
      context.read<FavoritesBloc>().add(
            ChangeFavoriteCartStatus(favProduct: favProduct),
          );
    } else {
      context
          .read<FavoritesBloc>()
          .add(ChangeFavoriteCartStatus(favProduct: favProduct));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isInCart = favProduct.isInCart;

    return IntrinsicHeight(
      child: Row(
        children: [
          InkWell(
            onTap: () => _openProduct(context),
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
                onTap: () => _remove(context),
                borderRadius: BorderRadius.circular(50),
                child: const CustomIcon(
                  iconName: 'close',
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              CustomSquareButton(
                onPressed: () => _changeCartStatus(context),
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
