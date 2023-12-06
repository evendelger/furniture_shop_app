import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/notification/notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const NotificationAppBar(),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Test'),
          ),
        ),
      ],
    );
  }
}
