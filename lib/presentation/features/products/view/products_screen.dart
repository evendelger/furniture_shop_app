import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
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
              final catBloc = context.read<CategoriesBloc>();
              context
                  .read<ProductsBloc>()
                  .add(LoadProducts(category: catBloc.state.active));
              Future.delayed(const Duration(seconds: 2));
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
                          .add(LoadProducts(category: state.active));
                    },
                    child: BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (context, state) {
                        switch (state) {
                          case ProductsLoading():
                            return const SliverFillRemaining(
                              child: CircularIndicator(),
                            );
                          case ProductsFailed():
                            return SliverFillRemaining(
                              child: MessageWidget(message: state.message),
                            );
                          case ProductsLoaded():
                            return ProductsSliverGrid(products: state.products);
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

class ProductsSliverGrid extends StatelessWidget {
  const ProductsSliverGrid({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
        mainAxisExtent: 255,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CardItem(product: products[index])
            .animate()
            .fadeIn(duration: 1000.ms);
      },
    );
  }
}
