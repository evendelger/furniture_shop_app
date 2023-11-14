import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class FavoriteProductWidget extends StatelessWidget {
  const FavoriteProductWidget({
    super.key,
    required this.product,
  });

  final Product product;

  void _remove(BuildContext context) {
    context.read<FavoritesBloc>().add(ChangeStatus(product: product));
  }

  void _openProduct(BuildContext context) {
    context.router.push(ProductCardRoute(product: product));
  }

  @override
  Widget build(BuildContext context) {
    // к сожалению, без этого виджета кнопка корзины никак не смещается вниз
    return IntrinsicHeight(
      child: Row(
        children: [
          InkWell(
            onTap: () => _openProduct(context),
            child: RoundedImageWidget(
              imageUrl: product.image,
              height: 100,
            ),
          ),
          const SizedBox(width: 20),
          ProductDataColumn(product: product),
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
                onPressed: () {},
                backgroundColor: AppColors.iconGreyColor,
                iconColor: AppColors.primary,
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
