import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';
import 'package:furniture_shop_app/presentation/ui/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductCard extends StatelessWidget {
  const ShimmerProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: _ShimmerImage(),
          ),
          _ShimmerTitle(),
          _ShimmerPrice(),
          _ShimmerRating(),
          Expanded(child: _ShimmerDescription()),
        ],
      ),
    );
  }
}

class _ShimmerImage extends StatelessWidget {
  const _ShimmerImage();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: UiConstants.imagePadding),
      child: Container(
        height: size.height / 1.68,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          ),
          color: AppColors.shimmerBackground,
        ),
      ),
    );
  }
}

class _ShimmerTitle extends StatelessWidget {
  const _ShimmerTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 35),
      child: const RoundedContainer(
        width: 200,
        height: 23,
      ),
    );
  }
}

class _ShimmerPrice extends StatelessWidget {
  const _ShimmerPrice();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiConstants.padding.copyWith(top: 20),
      child: const RoundedContainer(
        height: 25,
        width: 125,
      ),
    );
  }
}

class _ShimmerRating extends StatelessWidget {
  const _ShimmerRating();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiConstants.padding.copyWith(top: 20),
      child: const RoundedContainer(
        width: 150,
        height: 30,
      ),
    );
  }
}

class _ShimmerDescription extends StatelessWidget {
  const _ShimmerDescription();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiConstants.padding.copyWith(bottom: 20),
      child: const RoundedContainer(
        height: 100,
      ),
    );
  }
}
