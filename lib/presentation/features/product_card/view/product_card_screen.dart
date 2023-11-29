import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:furniture_shop_app/presentation/features/product_card/product_card.dart';
import 'package:furniture_shop_app/locator.dart';

@RoutePage()
class ProductCardScreen extends StatelessWidget {
  const ProductCardScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductSelectBloc(
        repository: locator<AbstractFavoritesRepository>(),
      )..add(ChangeProduct(product: product)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            ProductInfo(product: product),
            Positioned(
              left: 25,
              right: 25,
              bottom: 30,
              child: ActionButtons(product: product),
            ),
          ],
        ),
      ),
    );
  }
}
