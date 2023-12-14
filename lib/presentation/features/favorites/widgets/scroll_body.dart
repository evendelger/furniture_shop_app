import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/ui/constants/app_constants.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ScrollBody extends StatelessWidget {
  const ScrollBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          switch (state) {
            case FavoritesLoading():
              return const ShimmerProductsList();
            case FavoritesLoaded():
              {
                if (state.products.isEmpty) {
                  return const Center(
                    child: Text("You don't have any favorite products"),
                  ).animate(effects: AppConstants.fadeInTransition);
                } else {
                  return FavoritesList(products: state.products);
                }
              }
            case FavoritesFailed():
              return Center(
                child: ErrorMessageWidget(
                  message: state.errorMessage,
                  productsRefreshType: ProductsRefreshType.feature,
                ),
              );
          }
        },
      ),
    );
  }
}

class FavoritesList extends StatelessWidget {
  const FavoritesList({
    super.key,
    required this.products,
  });

  final List<FavoriteProduct> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) =>
            FavoriteProductWidget(favProduct: products[index]),
        separatorBuilder: (_, __) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(),
        ),
      ),
    );
  }
}
