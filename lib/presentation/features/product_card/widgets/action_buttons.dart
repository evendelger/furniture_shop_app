import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

enum CartButtonStatus {
  loading,
  canAdd,
  cannotAdd,
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<ProductCardBloc, ProductCardState>(
          builder: (context, state) {
            return _AddToFavoritesButton(
              product: state.product,
              isFavorite: state.isFavorite,
            );
          },
        ),
        const SizedBox(width: 15),
        Expanded(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              switch (state) {
                case CartLoading():
                  return _AddToCartButton(
                    product: product,
                    cartButtonStatus: CartButtonStatus.loading,
                  );
                case CartLoaded():
                  {
                    if (state.cartProducts
                        .map((cp) => cp.product)
                        .contains(product)) {
                      return _AddToCartButton(
                        product: product,
                        cartButtonStatus: CartButtonStatus.cannotAdd,
                      );
                    } else {
                      return _AddToCartButton(
                        product: product,
                        cartButtonStatus: CartButtonStatus.canAdd,
                      );
                    }
                  }
              }
            },
          ),
        ),
      ],
    );
  }
}

class _AddToFavoritesButton extends StatelessWidget {
  const _AddToFavoritesButton({
    this.product,
    required this.isFavorite,
  });

  final Product? product;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: product == null
          ? null
          : () {
              // TODO
              // context
              //     .read<ProductSelectBloc>()
              //     .add(const ChangeFavoriteValue());
              // context
              //     .read<FavoritesBloc>()
              //     .add(ChangeFavoriteStatus(product: product!));
            },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
            isFavorite ? AppColors.blueGray : AppColors.primary),
        fixedSize: const MaterialStatePropertyAll(Size(60, 60)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        elevation: const MaterialStatePropertyAll(0),
      ),
      child: product == null
          ? const CircularIndicator(radius: 10)
          : Icon(
              Icons.bookmark_outline,
              color: isFavorite ? AppColors.primary : AppColors.white,
              size: 30,
            ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({
    required this.product,
    required this.cartButtonStatus,
  });

  final Product product;
  final CartButtonStatus cartButtonStatus;

  void _addToCart(BuildContext context) {
    final count = context.read<ProductCardBloc>().state.inCartValue;
    context.read<CartBloc>().add(ChangeCartStatus(
          product: product,
          countToAdd: count,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x3F303030),
            blurRadius: 20,
            offset: Offset(0, 10),
            spreadRadius: 0,
          )
        ],
      ),
      child: ElevatedButton(
          onPressed: cartButtonStatus != CartButtonStatus.loading
              ? () => _addToCart(context)
              : null,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                cartButtonStatus == CartButtonStatus.canAdd
                    ? AppColors.primary
                    : AppColors.blueGray),
            minimumSize: const MaterialStatePropertyAll(Size.fromHeight(60)),
            padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            elevation: const MaterialStatePropertyAll(0),
          ),
          child: cartButtonStatus == CartButtonStatus.canAdd
              ? Text(
                  'Add to cart',
                  style: AppFonts.nsSemiBold.copyWith(
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                )
              : Text(
                  'Remove from cart',
                  style: AppFonts.nsSemiBold.copyWith(
                    fontSize: 20,
                    color: AppColors.primary,
                  ),
                )),
    );
  }
}
