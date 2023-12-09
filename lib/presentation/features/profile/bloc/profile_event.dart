part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

final class FetchProfile extends ProfileEvent {
  const FetchProfile();
}

final class SelectGalleryImage extends ProfileEvent {
  const SelectGalleryImage();
}

final class SelectCameraImage extends ProfileEvent {
  const SelectCameraImage();
}

final class _SelectImage extends ProfileEvent {
  const _SelectImage({required this.selectImageSource});

  final SelectImageSource selectImageSource;

  @override
  List<Object?> get props => [selectImageSource];
}
