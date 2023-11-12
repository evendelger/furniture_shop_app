import 'package:flutter/widgets.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.rating,
    required this.reviews,
  });

  final double rating;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomIcon(
          iconName: 'popular',
          color: AppColors.yellow,
          size: 20,
        ),
        const SizedBox(width: 10),
        _RatingValue(rating: rating),
        const SizedBox(width: 20),
        _ReviewsValue(reviews: reviews),
      ],
    );
  }
}

class _ReviewsValue extends StatelessWidget {
  const _ReviewsValue({
    super.key,
    required this.reviews,
  });

  final int reviews;

  @override
  Widget build(BuildContext context) {
    final afterText = reviews == 1 ? 'review' : 'reviews';
    return Text(
      '($reviews $afterText)',
      style: AppFonts.nsSemiBold.copyWith(
        fontSize: 14,
        color: AppColors.grey,
      ),
    );
  }
}

class _RatingValue extends StatelessWidget {
  const _RatingValue({
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$rating',
      style: AppFonts.nsBold.copyWith(
        fontSize: 18,
        color: AppColors.blackFont,
      ),
    );
  }
}
