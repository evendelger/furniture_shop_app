import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:talker/talker.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Talker().info('selected ${product.title}'),
      borderRadius: BorderRadius.circular(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              _ItemImage(imageUrl: product.image),
              const _FavouritedIcon(),
            ],
          ),
          const SizedBox(height: 10),
          _ItemTitle(title: product.title),
          const SizedBox(height: 5),
          _ItemPrice(price: product.price),
        ],
      ),
    );
  }
}

class _ItemPrice extends StatelessWidget {
  const _ItemPrice({required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ ${price}0',
      style: AppFonts.nsBold.copyWith(color: AppColors.blackFont),
    );
  }
}

class _ItemTitle extends StatelessWidget {
  const _ItemTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppFonts.nsRegular.copyWith(color: AppColors.black3),
    );
  }
}

class _ItemImage extends StatelessWidget {
  const _ItemImage({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 200,
        fit: BoxFit.fitWidth,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) =>
            const Icon(Icons.error, color: AppColors.primary),
        progressIndicatorBuilder: (context, url, progress) =>
            const CircularIndicator(
          radius: 10,
        ),
      ),
    );
  }
}

class _FavouritedIcon extends StatelessWidget {
  const _FavouritedIcon();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 0,
      child: CustomSquareButton(
        backgroundColor: AppColors.greyWithOpacity,
        iconColor: AppColors.white,
        sideLength: 30,
        iconName: 'shopping_bag',
        iconLength: 20,
        borderRadius: 6,
        onPressed: () {},
      ),
    );
  }
}
