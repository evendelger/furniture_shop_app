import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/cart/cart.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularIndicator(radius: 10);
        }
        if (state is CartLoaded) {
          final inCartProduct =
              state.cartProducts.where((cp) => cp.product.id == product.id);

          if (inCartProduct.isNotEmpty) {
            return _CartDataRow(cartProduct: inCartProduct.first);
          }
        }
        return const _ProductCartDataRow();
      },
    );
  }
}

class _CartDataRow extends StatelessWidget {
  const _CartDataRow({
    required this.cartProduct,
  });

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChangeCountButton(
          icon: Icons.add,
          increase: true,
          blocType: BlocType.cart,
          cartProduct: cartProduct,
        ),
        const SizedBox(width: 15),
        Text(
          cartProduct.inCartValue.toString().padLeft(2, '0'),
          style: AppFonts.nsSemiBold.copyWith(
            fontSize: 18,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 15),
        ChangeCountButton(
          icon: Icons.remove,
          increase: false,
          blocType: BlocType.cart,
          cartProduct: cartProduct,
        ),
      ],
    );
  }
}

class _ProductCartDataRow extends StatelessWidget {
  const _ProductCartDataRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ChangeCountButton(
          icon: Icons.add,
          increase: true,
          blocType: BlocType.productCard,
        ),
        const SizedBox(width: 15),
        BlocBuilder<ProductCardBloc, ProductCardState>(
          builder: (context, state) {
            return Text(
              state.inCartValue.toString().padLeft(2, '0'),
              style: AppFonts.nsSemiBold.copyWith(
                fontSize: 18,
                color: AppColors.primary,
              ),
            );
          },
        ),
        const SizedBox(width: 15),
        const ChangeCountButton(
          icon: Icons.remove,
          increase: false,
          blocType: BlocType.productCard,
        ),
      ],
    );
  }
}
