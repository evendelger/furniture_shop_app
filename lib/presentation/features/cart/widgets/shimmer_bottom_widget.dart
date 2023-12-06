import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBottomWidget extends StatelessWidget {
  const ShimmerBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textContainer = RoundedContainer(
      height: 18,
      width: 100,
      borderRadius: 8,
    );

    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 28),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textContainer,
                textContainer,
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
            child: const RoundedContainer(
              height: 60,
              borderRadius: 8,
            ),
          ),
        ],
      ),
    );
  }
}
