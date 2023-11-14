import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/circular_indicator.dart';

class RoundedImageWidget extends StatelessWidget {
  const RoundedImageWidget({
    super.key,
    required this.imageUrl,
    required this.widthSize,
  });

  final String imageUrl;
  final double widthSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: widthSize,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: widthSize,
            width: widthSize,
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
        progressIndicatorBuilder: (context, url, progress) => SizedBox(
          height: widthSize,
          width: widthSize,
          child: const CircularIndicator(radius: 10),
        ),
      ),
    );
  }
}
