import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({super.key, required this.product});

  final ProductPreview product;

  void _openProductCard(BuildContext context) =>
      context.push(Routes.productCard, extra: product.id);

  @override
  Widget build(BuildContext context) {
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
              _CartIcon(id: product.id),
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

class _CartIcon extends StatelessWidget {
  const _CartIcon({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 0,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          switch (state) {
            case CartLoading():
              return const _ShimmerLoadingIcon();
            case CartLoaded():
              {
                final foundedProduct = state.cartProducts.where(
                  (cp) => cp.product.id == id,
                );
                final isInCart = foundedProduct.isEmpty ? false : true;
                return _LoadedIcon(
                  isInCart: isInCart,
                  id: id,
                );
              }
          }
        },
      ),
    );
  }
}

class _ShimmerLoadingIcon extends StatelessWidget {
  const _ShimmerLoadingIcon();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(
        width: 30,
        height: 30,
        color: AppColors.shimmerBackground,
      ),
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
    return CustomSquareButton(
      backgroundColor:
          isInCart ? AppColors.whiteWithOpacity : AppColors.greyWithOpacity,
      iconColor: isInCart ? AppColors.primary : AppColors.white,
      sideLength: 30,
      iconName: 'shopping_bag',
      iconLength: 20,
      borderRadius: 6,
      onPressed: () => _changeCartStatus(context),
    );
  }
}
