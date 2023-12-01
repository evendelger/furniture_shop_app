import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:go_router/go_router.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({super.key});

  void _goToCart(BuildContext context) => context.push(Routes.cart);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 40,
      stretch: true,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
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
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () => _goToCart(context),
            icon: SvgPicture.asset(
              'assets/icons/shopping_cart.svg',
              width: 26,
              height: 26,
            ),
          ),
        ),
      ],
    );
  }
}
