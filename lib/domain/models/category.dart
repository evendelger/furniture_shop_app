import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class Category {
  const Category({
    required this.title,
    required this.iconName,
    required this.backgroundColor,
    required this.iconColor,
  });

  final String title;
  final String iconName;
  final Color backgroundColor;
  final Color iconColor;

  factory Category.furniture({
    required String title,
    required String iconName,
  }) {
    return Category(
      title: title,
      iconName: iconName,
      backgroundColor: AppColors.disabledField,
      iconColor: AppColors.lightGrey,
    );
  }

  factory Category.popular() {
    return const Category(
      title: 'Popular',
      iconName: 'star',
      backgroundColor: AppColors.blackFont,
      iconColor: AppColors.white,
    );
  }
}
