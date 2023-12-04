import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/auth/auth.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  // TODO
  void _logout(BuildContext context) =>
      locator<AuthBloc>().add(const AuthLogOut());

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 40,
      stretch: true,
      pinned: true,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/search.svg',
          color: AppColors.grey,
          fit: BoxFit.scaleDown,
        ),
      ),
      title: Text(
        'Profile',
        style: AppFonts.mrwBold.copyWith(
          fontSize: 16,
          color: AppColors.primary,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () => _logout(context),
            icon: SvgPicture.asset(
              'assets/icons/exit.svg',
              width: 26,
              height: 26,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
