import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/data/permission_client/constants/permission_exceptions.dart';
import 'package:furniture_shop_app/data/repositories/repositories.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required IProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        super(const ProfileLoading()) {
    on<ProfileFetch>(_fetch);
    on<ProfileSelectGalleryImage>(_selectGalleryImage);
    on<ProfileSelectCameraImage>(_selectCameraImage);
    on<_ProfileSelectImage>(_selectImage);
  }

  final IProfileRepository _profileRepository;

  Future<void> _fetch(
    ProfileFetch event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());
    try {
      final profileModel = await _profileRepository.getProfileModel();
      emit(ProfileLoaded(profileModel: profileModel));
    } catch (e) {
      emit(ProfileLoaded(
        profileModel: ProfileModel.anon(),
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _selectGalleryImage(
    ProfileSelectGalleryImage event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is! ProfileLoading) {
      add(const _ProfileSelectImage(
          selectImageSource: SelectImageSource.gallery));
    }
  }

  Future<void> _selectCameraImage(
    ProfileSelectCameraImage event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is! ProfileLoading) {
      add(const _ProfileSelectImage(
          selectImageSource: SelectImageSource.camera));
    }
  }

  Future<void> _selectImage(
    _ProfileSelectImage event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final linkToImage = switch (event.selectImageSource) {
        SelectImageSource.gallery =>
          await _profileRepository.selectGalleryImageAndGetLink(),
        SelectImageSource.camera =>
          await _profileRepository.selectCameraImageAndGetLink(),
      };

      if (linkToImage.isNotEmpty) {
        final newModel = (state as ProfileLoaded)
            .profileModel
            .copyWith(photoUrl: linkToImage);
        emit(ProfileLoaded(profileModel: newModel));
      }
    } on PermissionException catch (e) {
      emit((state as ProfileLoaded).copyWith(errorMessage: e.message));
    } catch (e) {
      emit((state as ProfileLoaded).copyWith(errorMessage: e.toString()));
    }
  }
}
