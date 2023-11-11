import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';

@RoutePage()
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: MyAppBar(),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: CategoriesListDelegate(),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                mainAxisExtent: 270,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CardItem().animate().fadeIn(duration: 1000.ms);
              },
            ),
          ),
        ],
      ),
    );
  }
}
