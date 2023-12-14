import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductsGrid extends StatelessWidget {
  const ShimmerProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      // к сожалению не работает с SliverGrid по непонятной причине(скорее всего из-за Shimmer),
      // поэтому приходится использовать GridView и также изменять gridDelegate :(
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 255,
        ),
        itemCount: 4,
        itemBuilder: (_, __) => const _SingleGridItem(),
      ),
    );
  }
}

class _SingleGridItem extends StatelessWidget {
  const _SingleGridItem();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: RoundedContainer(
            width: 200,
            borderRadius: 10,
          ),
        ),
        SizedBox(height: 15),
        RoundedContainer(
          width: 100,
          height: 15,
          borderRadius: 10,
        ),
        SizedBox(height: 10),
        RoundedContainer(
          width: 50,
          height: 15,
          borderRadius: 10,
        ),
      ],
    );
  }
}
