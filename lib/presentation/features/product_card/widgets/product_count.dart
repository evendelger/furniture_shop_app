import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ChangeCountButton(
          icon: Icons.add,
          increase: true,
          blocType: BlocType.favorites,
        ),
        const SizedBox(width: 15),
        BlocBuilder<ProductSelectBloc, ProductSelectState>(
          buildWhen: (p, c) => p.count != c.count,
          builder: (context, state) {
            return Text(
              state.count.toString().padLeft(2, '0'),
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
          blocType: BlocType.favorites,
        ),
      ],
    );
  }
}
