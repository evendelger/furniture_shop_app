import 'package:flutter/widgets.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserProfile extends StatelessWidget {
  const ShimmerUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: const Row(
        children: [
          RoundedContainer(
            width: 80,
            height: 80,
            borderRadius: 50,
          ),
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedContainer(
                width: 200,
                height: 20,
              ),
              SizedBox(height: 10),
              RoundedContainer(
                width: 150,
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
