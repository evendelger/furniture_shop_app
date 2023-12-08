import 'package:flutter/material.dart';
import 'package:furniture_shop_app/presentation/features/profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          UserProfileWidget(),
        ],
      ),
    );
  }
}
