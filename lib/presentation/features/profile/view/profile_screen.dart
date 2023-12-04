import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(top: 20),
          sliver: ProfileAppBar(),
        )
      ],
    );
  }
}
