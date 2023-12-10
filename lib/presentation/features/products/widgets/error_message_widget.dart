import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

enum ProductsRefreshType {
  caterory,
  search,
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({
    super.key,
    required this.message,
    required this.productsRefreshType,
  });

  final String message;
  final ProductsRefreshType productsRefreshType;

  void _loadProducts(BuildContext context) {
    switch (productsRefreshType) {
      case ProductsRefreshType.caterory:
        context.read<ProductsBloc>().add(const ProductsFetch());
      case ProductsRefreshType.search:
        final bloc = context.read<ProductsSearchBloc>();
        final query = (bloc.state as ProductsSearchFailed).query;
        bloc.add(ProductsSearchByQuery(query: query));
    }
  }

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
            onPressed: () => _loadProducts(context),
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
