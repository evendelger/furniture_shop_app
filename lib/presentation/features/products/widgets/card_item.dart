import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.productItem,
  });

  final ProductsItem productItem;

  void _openProductCard(BuildContext context) =>
      context.push(Routes.productCard, extra: productItem.product.id);

  @override
  Widget build(BuildContext context) {
    final product = productItem.product;

    return InkWell(
      onTap: () => _openProductCard(context),
      borderRadius: BorderRadius.circular(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              RoundedImageWidget(
                imageUrl: product.image,
                widthSize: 200,
              ),
              _LoadedIcon(
                id: product.id,
                isInCart: productItem.isInCart,
              ),
            ],
          ),
          const SizedBox(height: 10),
          _ItemTitle(title: product.title),
          const SizedBox(height: 5),
          _ItemPrice(price: product.price),
        ],
      ),
    );
  }
}

class _ItemPrice extends StatelessWidget {
  const _ItemPrice({required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ ${price}0',
      style: AppFonts.nsBold.copyWith(color: AppColors.blackFont),
    );
  }
}

class _ItemTitle extends StatelessWidget {
  const _ItemTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppFonts.nsRegular.copyWith(color: AppColors.black3),
    );
  }
}

class _LoadedIcon extends StatelessWidget {
  const _LoadedIcon({
    required this.isInCart,
    required this.id,
  });

  final bool isInCart;
  final String id;

  void _changeCartStatus(BuildContext context) => context.read<CartBloc>().add(
        isInCart ? RemoveCartProduct(id: id) : AddCartProduct(id: id),
      );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 0,
      child: CustomSquareButton(
        backgroundColor:
            isInCart ? AppColors.whiteWithOpacity : AppColors.greyWithOpacity,
        iconColor: isInCart ? AppColors.primary : AppColors.white,
        sideLength: 30,
        iconName: 'shopping_bag',
        iconLength: 20,
        borderRadius: 6,
        onPressed: () => _changeCartStatus(context),
      ),
    );
  }
}
