import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/constants/consttants.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:go_router/go_router.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  void _popBack(BuildContext context) => context.pop();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => _popBack(context),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Text(
        'My Cart',
        style: AppFonts.mrwBold.copyWith(
          fontSize: 16,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
