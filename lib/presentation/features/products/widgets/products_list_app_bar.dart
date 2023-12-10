import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 40,
      stretch: true,
      leading: IconButton(
        onPressed: () => _showSearchBottomsheet(context),
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
            onPressed: () => Functions.goToCart(context),
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

  Future<void> _showSearchBottomsheet(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (newContext) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ProductsScreenType>.value(
              value: context.read<ProductsScreenType>(),
            ),
            BlocProvider.value(
              value: context.read<ProductsSearchBloc>(),
            ),
            BlocProvider.value(
              value: context.read<ProductsBloc>(),
            ),
          ],
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(newContext).viewInsets.bottom,
            ),
            child: const SearchBottomSheet(),
          ),
        );
      },
    );
  }
}
