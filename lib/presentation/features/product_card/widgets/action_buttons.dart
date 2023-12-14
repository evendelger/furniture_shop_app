import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => PrCardBlocFunc.changeFavStatus(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: isFavorite ? AppColors.blueGray : AppColors.primary,
        fixedSize: const Size(60, 60),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 3,
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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => PrCardBlocFunc.changeCartStatus(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: isInCart ? AppColors.blueGray : AppColors.primary,
        minimumSize: const Size.fromHeight(60),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
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
    );
  }
}
