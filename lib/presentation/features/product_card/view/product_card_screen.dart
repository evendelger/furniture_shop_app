import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ProductCardScreen extends StatelessWidget {
  const ProductCardScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCardBloc(
        favoritesRepository: locator<IFavoritesRepository>(),
        cartRepository: locator<ICartRepository>(),
      )..add(CardOpen(id: id)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: BlocBuilder<ProductCardBloc, ProductCardState>(
          builder: (context, state) {
            switch (state) {
              case ProductCardLoading():
                return const ShimmerProductCard();
              case ProductCardLoaded():
                return LoadedCardWidget(state: state)
                    .animate()
                    .fadeIn(curve: Curves.easeOut, duration: 300.ms);
              case ProductCardFailed():
                return Center(
                  child: ErrorMessageWidget(
                    message: state.errorMessage,
                    productsRefreshType: ProductsRefreshType.card,
                    id: id,
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
