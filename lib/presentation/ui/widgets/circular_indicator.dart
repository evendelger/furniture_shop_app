import 'package:flutter/cupertino.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key, this.radius});

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: AppColors.primary,
        radius: radius ?? 15,
      ),
    );
  }
}
