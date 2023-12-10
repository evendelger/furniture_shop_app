import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/constants/constants.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ProductsCategoriesList extends StatelessWidget {
  const ProductsCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            final category = context.read<CategoriesBloc>().state.selected;
            context.read<ProductsBloc>().add(ProductsFetch(category: category));
          },
          color: AppColors.primary,
          edgeOffset: 180,
          displacement: 10,
          child: CustomScrollView(
            cacheExtent: Constants.customScrollCacheExtent,
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.only(top: 20),
                sliver: ProductsAppBar(),
              ),
              const SliverPersistentHeader(
                pinned: true,
                delegate: CategoriesListDelegate(),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                sliver: BlocListener<CategoriesBloc, CategoriesState>(
                  listener: (context, state) {
                    context
                        .read<ProductsBloc>()
                        .add(ProductsFetch(category: state.selected));
                  },
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      switch (state) {
                        case ProductsLoading():
                          return const SliverToBoxAdapter(
                            child: ShimmerProductsGrid(),
                          );
                        case ProductsFailed():
                          return SliverFillRemaining(
                            hasScrollBody: false,
                            child: ErrorMessageWidget(
                              message: state.errorMessage,
                              productsRefreshType: ProductsRefreshType.caterory,
                            ),
                          );
                        case ProductsLoaded():
                          return ProductsGrid(products: state.products);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
