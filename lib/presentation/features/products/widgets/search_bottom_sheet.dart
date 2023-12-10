import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .copyWith(top: 20, bottom: 40),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Search by product name',
                style: AppFonts.nsBold.copyWith(
                  fontSize: 20,
                  color: AppColors.blackFont,
                ),
              ),
              const SizedBox(height: 20),
              const SearchProductWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
