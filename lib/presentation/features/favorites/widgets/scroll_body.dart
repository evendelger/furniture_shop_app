import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ScrollBody extends StatelessWidget {
  const ScrollBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.only(top: 20),
          sliver: FavoritesAppBar(),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          sliver: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              switch (state) {
                case FavoritesLoading():
                  return const SliverFillRemaining(
                    child: CircularIndicator(),
                  );
                case FavoritesLoaded():
                  return FavoritesList(products: state.products);
              }
            },
          ),
        ),
      ],
    );
  }
}

class FavoritesList extends StatelessWidget {
  const FavoritesList({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: products.length,
      itemBuilder: (context, index) =>
          FavoriteProductWidget(product: products[index])
              .animate()
              .fadeIn(duration: 1000.ms),
      separatorBuilder: (_, __) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Divider(),
      ),
    );
  }
}
