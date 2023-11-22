import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

const _customHeight = kToolbarHeight + 50;

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const divider = Divider(color: AppColors.grey4);

    return AppBar(
      // Кастомная высота, т.к. решил немноо изменить дизайн
      toolbarHeight: _customHeight,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            const Expanded(child: divider),
            const SizedBox(width: 20),
            SvgPicture.asset(
              'assets/icons/app_icon.svg',
            ),
            const SizedBox(width: 20),
            const Expanded(child: divider),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_customHeight);
}
