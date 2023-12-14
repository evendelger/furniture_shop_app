import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_shop_app/presentation/ui/assets_paths/assets_paths.dart';

class CustomSquareButton extends StatelessWidget {
  const CustomSquareButton({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.sideLength,
    required this.iconName,
    required this.iconLength,
    required this.borderRadius,
    required this.onPressed,
  });

  final Color backgroundColor;
  final Color iconColor;
  final double sideLength;
  final double iconLength;
  final String iconName;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sideLength,
      child: MaterialButton(
        onPressed: onPressed,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 0,
        height: sideLength,
        padding: EdgeInsets.zero,
        child: SvgPicture.asset(
          SvgPaths.getByName(iconName),
          width: iconLength,
          height: iconLength,
          fit: BoxFit.scaleDown,
          color: iconColor,
        ),
      ),
    );
  }
}
