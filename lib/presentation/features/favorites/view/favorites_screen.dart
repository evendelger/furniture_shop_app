import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        ScrollBody(),
        AddAllWidget(),
      ],
    );
  }
}
