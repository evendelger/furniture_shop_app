import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 20),
      sliver: SliverAppBar(
        toolbarHeight: 40,
        stretch: true,
        pinned: true,
        title: Text(
          'Notification',
          style: AppFonts.mrwBold.copyWith(
            fontSize: 16,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
