import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_shop_app/presentation/ui/router/router.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:go_router/go_router.dart';

class FavoritesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FavoritesAppBar({super.key});

  void _goToCart(BuildContext context) => context.push(Routes.cart);

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Favorites'),
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/search.svg',
          color: AppColors.grey,
          fit: BoxFit.scaleDown,
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
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
