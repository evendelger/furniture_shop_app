import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/assets_paths/assets_paths.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class ProductsSearchAppBar extends StatelessWidget {
  const ProductsSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final searchQuery = context.read<ProductsScreenType>().searchQuery;

    return SliverAppBar(
      toolbarHeight: 40,
      pinned: true,
      scrolledUnderElevation: 0,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: SizedBox(),
      ),
      leading: IconButton(
        onPressed: () => PrScreenProviderFunc.returnToCateg(context),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Text(
        searchQuery,
        style: AppFonts.glsSemiBold.copyWith(
          color: AppColors.lightGrey,
          fontSize: 22,
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
            ),
          ),
        ),
      ],
    );
  }
}
