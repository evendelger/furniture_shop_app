import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';

@RoutePage()
class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ScrollBody(),
          AddAllWidget(),
        ],
      ),
    );
  }
}
