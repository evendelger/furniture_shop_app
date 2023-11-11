import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/category.dart';
import 'package:furniture_shop_app/presentation/features/products/constants/categories.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class CategoriesListDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemExtent: 78,
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) =>
              _CategoryItem(category: categoriesList[index]),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final iconLength = category.iconName == 'star' ? 20.0 : 28.0;
    final fontColor =
        category.iconName == 'star' ? AppColors.primary : AppColors.disabled;
    return Column(
      children: [
        CustomSquareButton(
          backgroundColor: category.backgroundColor,
          iconColor: category.iconColor,
          sideLength: 44,
          iconName: category.iconName,
          iconLength: iconLength,
          borderRadius: 12,
        ),
        Text(
          category.title,
          style: AppFonts.nsRegular.copyWith(
            fontSize: 14,
            color: fontColor,
          ),
        ),
      ],
    );
  }
}
