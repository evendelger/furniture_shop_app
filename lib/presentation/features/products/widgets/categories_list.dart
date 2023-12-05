import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/category.dart';
import 'package:furniture_shop_app/presentation/features/products/blocs/blocs.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class CategoriesListDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bloc = context.read<CategoriesBloc>();

    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            return ListView.builder(
              itemExtent: 78,
              scrollDirection: Axis.horizontal,
              itemCount: bloc.state.categories.length,
              itemBuilder: (context, index) =>
                  _CategoryItem(category: bloc.state.categories[index]),
            );
          },
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
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final isActive = context.read<CategoriesBloc>().state.selected == category;
    final fontColor = isActive ? AppColors.primary : AppColors.disabled;
    final backgroundColor =
        isActive ? AppColors.blackFont : AppColors.disabledField;
    final iconColor = isActive ? AppColors.white : AppColors.lightGrey;
    final textStyle = isActive
        ? AppFonts.nsSemiBold.copyWith(
            fontSize: 14,
            color: fontColor,
          )
        : AppFonts.nsRegular.copyWith(
            fontSize: 14,
            color: fontColor,
          );

    return Column(
      children: [
        CustomSquareButton(
          backgroundColor: backgroundColor,
          iconColor: iconColor,
          sideLength: 44,
          iconName: category.name,
          iconLength: 28,
          borderRadius: 12,
          onPressed: () => Functions.selectCategory(context, category),
        ),
        Text(
          toBeginningOfSentenceCase(category.name)!,
          style: textStyle,
        ),
      ],
    );
  }
}
