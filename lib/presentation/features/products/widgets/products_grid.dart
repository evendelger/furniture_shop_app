import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key, required this.products});

  final List<ProductPreview> products;

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
        return ProductCardItem(product: products[index])
            .animate()
            .fadeIn(duration: 1000.ms);
      },
    );
  }
}
