import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductsList extends StatelessWidget {
  const ShimmerProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, __) => const _SingleListItem(),
        separatorBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Divider(color: AppColors.shimmerBase),
        ),
        itemCount: 4,
      ),
    );
  }
}

class _SingleListItem extends StatelessWidget {
  const _SingleListItem();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedContainer(
          height: 100,
          width: 100,
          borderRadius: 10,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedContainer(
              height: 18,
              width: 200,
              borderRadius: 10,
            ),
            SizedBox(height: 5),
            RoundedContainer(
              height: 22,
              width: 100,
              borderRadius: 10,
            ),
          ],
        ),
      ],
    );
  }
}
