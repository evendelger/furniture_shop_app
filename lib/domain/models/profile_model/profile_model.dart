import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String displayName,
    required String email,
    String? photoUrl,
  }) = _ProfileModel;

  factory ProfileModel.anon() => const ProfileModel(
        displayName: 'Anonymous',
        email: '',
      );
}
