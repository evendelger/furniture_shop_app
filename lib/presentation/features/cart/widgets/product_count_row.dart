import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ProductCountRow extends StatelessWidget {
  const ProductCountRow({
    super.key,
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


// if (state is CartLoaded) {
        //   return FutureBuilder<bool>(
        //     future: CartUsecases.getStatus(cartProduct.product),
        //     initialData: false,
        //     builder: (context, snapshot) {
        //       if(snapshot.hasData) return _CountWidget(count: snapshot.data,);
        //     },
        //   );
        // }