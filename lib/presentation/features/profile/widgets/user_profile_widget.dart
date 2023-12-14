import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/presentation/features/profile/profile.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) => PopUpFunc.showErrorSnackBar(
          context, (state as ProfileLoaded).errorMessage!),
      listenWhen: (_, c) => c is ProfileLoaded && c.errorMessage != null,
      buildWhen: (_, c) => !(c is ProfileLoaded && c.errorMessage != null),
      builder: (context, state) {
        switch (state) {
          case ProfileLoading():
            return const ShimmerUserProfile();
          case ProfileLoaded():
            return LoadedUserProfile(profileModel: state.profileModel);
        }
      },
    );
  }
}
