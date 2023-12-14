part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

final class ProfileFetch extends ProfileEvent {
  const ProfileFetch();
}

final class ProfileSelectGalleryImage extends ProfileEvent {
  const ProfileSelectGalleryImage();
}

final class ProfileSelectCameraImage extends ProfileEvent {
  const ProfileSelectCameraImage();
}

final class _ProfileSelectImage extends ProfileEvent {
  const _ProfileSelectImage({required this.selectImageSource});

  final SelectImageSource selectImageSource;

  @override
  List<Object?> get props => [selectImageSource];
}
