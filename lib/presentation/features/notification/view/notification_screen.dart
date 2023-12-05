import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/favorites/favorites.dart';
import 'package:furniture_shop_app/presentation/features/notification/notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  void testFunc() {
    context.read<FavoritesBloc>().add(const FetchFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const NotificationAppBar(),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: testFunc,
            child: const Text('Test'),
          ),
        ),
      ],
    );
  }
}
