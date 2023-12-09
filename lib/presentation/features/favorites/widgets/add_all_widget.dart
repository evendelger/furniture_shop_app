import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';

class AddAllWidget extends StatelessWidget {
  const AddAllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        switch (state) {
          case FavoritesLoading():
            return const SizedBox.shrink();
          case FavoritesLoaded():
            {
              if (state.products.isNotEmpty) {
                return const AddAllButton().animate().fadeIn(
                      curve: Curves.easeOut,
                      duration: 500.ms,
                    );
              } else {
                return const SizedBox.shrink();
              }
            }
        }
      },
    );
  }
}
