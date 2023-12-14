import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/constants/app_constants.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ProductsSearchList extends StatelessWidget {
  const ProductsSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      cacheExtent: AppConstants.customScrollCacheExtent,
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.only(top: 20),
          sliver: ProductsSearchAppBar(),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          sliver: BlocBuilder<ProductsSearchBloc, ProductsSearchState>(
            builder: (context, state) {
              switch (state) {
                case ProductsSearchLoading():
                  return const SliverToBoxAdapter(
                    child: ShimmerProductsGrid(),
                  );
                case ProductsSearchFailed():
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: ErrorMessageWidget(
                      message: state.errorMessage,
                      productsRefreshType: ProductsRefreshType.search,
                    ),
                  );
                case ProductsSearchLoaded():
                  if (state.products.isEmpty) {
                    return const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text('Nothing was found for that name'),
                      ),
                    );
                  } else {
                    return ProductsGrid(products: state.products);
                  }
              }
            },
          ),
        ),
      ],
    );
  }
}
