import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/constants/constants.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesBloc(),
        ),
        BlocProvider(
          create: (context) => ProductsSearchBloc(
            productsRepository: locator<IProductsRepository>(),
            cartRepository: locator<ICartRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductsScreenType(),
        ),
      ],
      builder: (context, child) {
        final screenType = context.watch<ProductsScreenType>().screenType;
        switch (screenType) {
          case ScreenType.productsCategories:
            return const ProductsCategoriesList()
                .animate(effects: Constants.fadeInTransition);
          case ScreenType.productsSearch:
            return const ProductsSearchList()
                .animate(effects: Constants.fadeInTransition);
        }
      },
    );
  }
}
