part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

final class ProfileLoaded extends ProfileState {
  const ProfileLoaded({
    required this.profileModel,
    this.errorMessage,
  });

  final ProfileModel profileModel;
  final String? errorMessage;

  ProfileLoaded copyWith({
    ProfileModel? profileModel,
    String? errorMessage,
  }) {
    return ProfileLoaded(
      profileModel: profileModel ?? this.profileModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [profileModel, errorMessage];
}
