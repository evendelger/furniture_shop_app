import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class ColorSelectWidget extends StatelessWidget {
  const ColorSelectWidget({
    super.key,
    required this.selectedColor,
  });

  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      width: 64,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0x338A959E),
            blurRadius: 40,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SingleColorWidget(
            color: AppColors.colorSelect1,
            isSelected: selectedColor == AppColors.colorSelect1,
          ),
          _SingleColorWidget(
            color: AppColors.colorSelect2,
            isSelected: selectedColor == AppColors.colorSelect2,
          ),
          _SingleColorWidget(
            color: AppColors.colorSelect3,
            isSelected: selectedColor == AppColors.colorSelect3,
          ),
        ],
      ),
    );
  }
}

class _SingleColorWidget extends StatelessWidget {
  const _SingleColorWidget({
    required this.color,
    required this.isSelected,
  });

  final Color color;
  final bool isSelected;

  void _selectColor(BuildContext context) =>
      context.read<ProductCardBloc>().add(ChangeColor(color: color));

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(50);
    return Material(
      color: color,
      borderRadius: borderRadius,
      child: ClipOval(
        child: InkWell(
          onTap: () => _selectColor(context),
          borderRadius: borderRadius,
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              border: Border.all(
                width: 6,
                color: isSelected ? AppColors.lightGrey : AppColors.blueGray,
              ),
              borderRadius: borderRadius,
            ),
          ),
        ),
      ),
    );
  }
}
