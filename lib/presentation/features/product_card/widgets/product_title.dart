import 'package:flutter/widgets.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 25),
      child: Text(
        title,
        style: AppFonts.glsMedium.copyWith(
          fontSize: 24,
          color: AppColors.blackFont,
        ),
      ),
    );
  }
}
