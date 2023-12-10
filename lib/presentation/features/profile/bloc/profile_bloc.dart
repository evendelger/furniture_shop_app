import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/data/permissions/constants/permission_exceptions.dart';
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
    on<FetchProfile>(_fetchProfile);
    on<SelectGalleryImage>(_selectGalleryImage);
    on<SelectCameraImage>(_selectCameraImage);
    on<_SelectImage>(_selectImage);
  }

  final IProfileRepository _profileRepository;

  Future<void> _fetchProfile(
    FetchProfile event,
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
    SelectGalleryImage event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is! ProfileLoading) {
      add(const _SelectImage(selectImageSource: SelectImageSource.gallery));
    }
  }

  Future<void> _selectCameraImage(
    SelectCameraImage event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is! ProfileLoading) {
      add(const _SelectImage(selectImageSource: SelectImageSource.camera));
    }
  }

  Future<void> _selectImage(
    _SelectImage event,
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
