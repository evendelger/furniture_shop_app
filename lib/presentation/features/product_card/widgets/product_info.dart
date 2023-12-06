import 'package:flutter/widgets.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.state,
  });

  final ProductCardLoaded state;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                // из-за того, что изображения не одинакого размера, опытом вывел эту величину
                height: size.height / 1.68,
                child: ProductImage(imageUrl: state.product.image),
              ),
              const Positioned(
                left: UiConstants.imagePadding - 20,
                top: UiConstants.imagePadding,
                child: PopButton(),
              ),
              Positioned(
                left: UiConstants.imagePadding - 32,
                top: UiConstants.imagePadding * 3,
                child: ColorSelectWidget(selectedColor: state.color),
              ),
            ],
          ),
          ProductTitle(title: state.product.title),
          Padding(
            padding: UiConstants.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductPrice(price: state.product.price),
                if (state.isInCart)
                  ProductCount(
                    id: state.product.id,
                    inCartProduct: state.inCartValue!,
                  ),
              ],
            ),
          ),
          Padding(
            padding: UiConstants.padding,
            child: ProductRating(
              rating: state.product.rating,
              reviews: state.product.reviews,
            ),
          ),
          Padding(
            padding: UiConstants.padding,
            child: const ProductDescription(),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
