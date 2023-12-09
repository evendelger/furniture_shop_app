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
      )..add(const FetchProfile()),
      child: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            UserProfileWidget(),
          ],
        ),
      ),
    );
  }
}
