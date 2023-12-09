import 'package:furniture_shop_app/domain/models/models.dart';

abstract interface class IProfileRepository {
  Future<ProfileModel> getProfileModel();
  Future<String> selectGalleryImageAndGetLink();
  Future<String> selectCameraImageAndGetLink();
}
