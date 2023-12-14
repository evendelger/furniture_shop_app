import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_shop_app/presentation/ui/constants/app_constants.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/assets_paths/assets_paths.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class FavoritesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FavoritesAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Favorites'),
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          SvgPaths.search,
          color: AppColors.grey,
          fit: BoxFit.scaleDown,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () => RouterFunc.goToCart(context),
            icon: SvgPicture.asset(
              SvgPaths.shoppingCart,
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
