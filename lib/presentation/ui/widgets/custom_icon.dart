import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shop_app/presentation/ui/assets_paths/assets_paths.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.iconName,
    this.color,
    this.size,
  });

  final String iconName;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      SvgPaths.getByName(iconName),
      color: color,
      fit: BoxFit.scaleDown,
      height: size,
      //width: size,
    );
  }
}
