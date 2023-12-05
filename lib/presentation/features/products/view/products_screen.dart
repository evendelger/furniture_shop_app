import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return RefreshIndicator(
            onRefresh: () async {
              final category = context.read<CategoriesBloc>().state.selected;
              context
                  .read<ProductsBloc>()
                  .add(FetchProducts(category: category));
            },
            color: AppColors.primary,
            edgeOffset: 180,
            displacement: 10,
            child: CustomScrollView(
              cacheExtent: 3500,
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.only(top: 20),
                  sliver: ProductsAppBar(),
                ),
                SliverPersistentHeader(
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
                          .add(FetchProducts(category: state.selected));
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
                              child: ErrorMessageWidget(message: state.message),
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
      ),
    );
  }
}
