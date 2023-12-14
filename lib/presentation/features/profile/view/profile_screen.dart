import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        profileRepository: locator<IProfileRepository>(),
      )..add(const ProfileFetch()),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const UserProfileWidget(),
            const SizedBox(height: 30),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: SettingsData.data.length,
              itemBuilder: (context, index) {
                final entry = SettingsData.entries[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SettingCardWidget(
                    title: entry.key,
                    subtitle: entry.value,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
