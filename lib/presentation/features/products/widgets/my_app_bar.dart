import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 40,
      pinned: false,
      stretch: true,
      leading: Container(
        width: 24,
        height: 24,
        color: Colors.transparent,
        child: SvgPicture.asset(
          'assets/icons/search.svg',
          color: AppColors.grey,
          fit: BoxFit.scaleDown,
        ),
      ),
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Make home\n',
              style: AppFonts.glsRegular.copyWith(
                color: AppColors.lightGrey,
                fontSize: 18,
              ),
            ),
            TextSpan(
              text: 'BEAUTIFUL',
              style: AppFonts.glsBold.copyWith(
                color: AppColors.dark,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SvgPicture.asset(
            'assets/icons/shopping_cart.svg',
            width: 26,
            height: 26,
          ),
        ),
      ],
    );
  }
}
