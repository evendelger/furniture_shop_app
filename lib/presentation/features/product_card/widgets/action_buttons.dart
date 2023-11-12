import 'package:flutter/material.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _AddToFeaturedButton(),
        SizedBox(width: 15),
        Expanded(
          child: _AddToCartButton(),
        ),
      ],
    );
  }
}

class _AddToFeaturedButton extends StatelessWidget {
  const _AddToFeaturedButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(AppColors.blueGray),
        fixedSize: const MaterialStatePropertyAll(Size(60, 60)),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        elevation: const MaterialStatePropertyAll(0),
      ),
      child: const Icon(
        Icons.bookmark_outline,
        color: AppColors.primary,
        size: 30,
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x3F303030),
            blurRadius: 20,
            offset: Offset(0, 10),
            spreadRadius: 0,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
          minimumSize: const MaterialStatePropertyAll(Size.fromHeight(60)),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          elevation: const MaterialStatePropertyAll(0),
        ),
        child: Text(
          'Add to cart',
          style: AppFonts.nsSemiBold.copyWith(
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
