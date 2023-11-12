import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _ChangeCountButton(icon: Icons.add, isAdd: true),
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
        const _ChangeCountButton(icon: Icons.remove, isAdd: false),
      ],
    );
  }
}

class _ChangeCountButton extends StatelessWidget {
  const _ChangeCountButton({
    required this.icon,
    required this.isAdd,
  });

  final IconData icon;
  final bool isAdd;

  void _changeCount(BuildContext context) =>
      context.read<ProductSelectBloc>().add(ChangeCount(isAdd: isAdd));

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(6);
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: AppColors.iconGreyColor,
      ),
      child: IconButton(
        onPressed: () => _changeCount(context),
        padding: EdgeInsets.zero,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: borderRadius),
          ),
        ),
        icon: Icon(
          icon,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
