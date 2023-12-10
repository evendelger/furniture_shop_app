import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/ui/constants/constants.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(Constants.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: Constants.appBarHeight,
      title: Text(
        'Notification',
        style: AppFonts.mrwBold.copyWith(
          fontSize: 16,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
