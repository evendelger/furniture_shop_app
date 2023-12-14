import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

enum ProductsRefreshType {
  caterory,
  search,
  card,
  feature,
  cart,
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({
    super.key,
    required this.message,
    required this.productsRefreshType,
    this.id,
  });

  final String message;
  final ProductsRefreshType productsRefreshType;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: AppFonts.nsSemiBold.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () =>
                BlocFunc.loadProducts(context, productsRefreshType, id: id),
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
            ),
            child: Text(
              'Try Again',
              style: AppFonts.nsBold.copyWith(
                color: AppColors.white,
                fontSize: 22,
                letterSpacing: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
