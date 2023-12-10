import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

enum BlocType {
  cart,
  productCard,
}

class ChangeCountButton extends StatelessWidget {
  const ChangeCountButton({
    super.key,
    required this.icon,
    required this.increase,
    required this.id,
    required this.blocType,
  });

  final IconData icon;
  final bool increase;
  final String id;
  final BlocType blocType;

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
        onPressed: () => BlocFunc.changeCount(context, blocType, id, increase),
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
