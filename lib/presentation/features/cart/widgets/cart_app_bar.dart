import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  void _popBack(BuildContext context) => context.router.pop();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 40,
      stretch: true,
      pinned: true,
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
