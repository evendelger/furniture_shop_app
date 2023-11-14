import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

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
        BlocBuilder<ProductSelectBloc, ProductSelectState>(
          //buildWhen: (p, c) => p.isFavorite != c.isFavorite,
          builder: (context, state) {
            return _AddToFeaturedButton(
              product: state.product,
              isFavorite: state.isFavorite,
            );
          },
        ),
        const SizedBox(width: 15),
        const Expanded(
          child: _AddToCartButton(),
        ),
      ],
    );
  }
}

class _AddToFeaturedButton extends StatelessWidget {
  const _AddToFeaturedButton({
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
              context
                  .read<ProductSelectBloc>()
                  .add(const ChangeFavoriteValue());
              context
                  .read<FavoritesBloc>()
                  .add(ChangeStatus(product: product!));
            },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
            isFavorite ? AppColors.primary : AppColors.blueGray),
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
              color: isFavorite ? AppColors.white : AppColors.primary,
              size: 30,
            ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton();

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
          minimumSize: const MaterialStatePropertyAll(Size.fromHeight(60)),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          elevation: const MaterialStatePropertyAll(0),
        ),
        child: Text(
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
