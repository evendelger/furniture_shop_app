import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.state,
  });

  final ProductCardLoaded state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _AddToFavoritesButton(
          isFavorite: state.isFavorite,
          id: state.product.id,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _AddToCartButton(
            id: state.product.id,
            isInCart: state.isInCart,
          ),
        ),
      ],
    );
  }
}

class _AddToFavoritesButton extends StatelessWidget {
  const _AddToFavoritesButton({
    required this.id,
    required this.isFavorite,
  });

  final String id;
  final bool isFavorite;

  void _changeFavoriteStatus(BuildContext context) =>
      context.read<ProductCardBloc>().add(const ChangeFavoriteStatus());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _changeFavoriteStatus(context),
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
      child: Icon(
        Icons.bookmark_outline,
        color: isFavorite ? AppColors.primary : AppColors.white,
        size: 30,
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({
    required this.id,
    required this.isInCart,
  });

  final String id;
  final bool isInCart;

  void _addToCart(BuildContext context) =>
      context.read<ProductCardBloc>().add(const ChangeCartStatus());

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
        onPressed: () => _addToCart(context),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              isInCart ? AppColors.blueGray : AppColors.primary),
          minimumSize: const MaterialStatePropertyAll(Size.fromHeight(60)),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          elevation: const MaterialStatePropertyAll(0),
        ),
        child: isInCart
            ? Text(
                'Remove from cart',
                style: AppFonts.nsSemiBold.copyWith(
                  fontSize: 20,
                  color: AppColors.primary,
                ),
              )
            : Text(
                'Add to cart',
                style: AppFonts.nsSemiBold.copyWith(
                  fontSize: 20,
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
