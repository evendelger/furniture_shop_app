import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/notification/notification.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        NotificationAppBar(),
      ],
    );
  }
}
