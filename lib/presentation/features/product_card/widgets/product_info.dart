import 'package:flutter/widgets.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';

const _padding = 52.0;

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ProductImage(imageUrl: product.image),
              const Positioned(
                left: _padding - 20,
                top: _padding,
                child: PopButton(),
              ),
              const Positioned(
                left: _padding - 32,
                top: _padding * 3,
                child: ColorSelectWidget(),
              ),
            ],
          ),
          ProductTitle(title: product.title),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductPrice(price: product.price),
                const ProductCount(),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 10),
            child: ProductRating(
              rating: product.rating,
              reviews: product.reviews,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 10),
            child: const ProductDescription(),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
