import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:furniture_shop_app/data/firebase/firebase.dart';
import 'package:furniture_shop_app/data/permission_client/permission_client.dart';
import 'package:furniture_shop_app/data/permission_client/permission_exceptions.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:image_picker/image_picker.dart';

enum SelectImageSource {
  gallery,
  camera,
}

class ProfileRepository implements IProfileRepository {
  const ProfileRepository({
    required this.permissionClient,
    required this.storageClient,
    required this.authClient,
  });

  final PermissionClient permissionClient;
  final StorageClient storageClient;
  final AuthClient authClient;

  @override
  Future<ProfileModel> getProfileModel() async {
    try {
      final userName = authClient.getUserName;
      final userEmail = authClient.getUserEmail;
      final userPhoto = authClient.getUserImage;

      if (userName.isEmpty && userEmail.isEmpty) {
        return ProfileModel.anon();
      }
      return ProfileModel(
        displayName: userName,
        email: userEmail,
        photoUrl: userPhoto,
      );
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    }
  }

  @override
  Future<String> selectGalleryImageAndGetLink() =>
      _selectImageAndGetLink(SelectImageSource.gallery);

  @override
  Future<String> selectCameraImageAndGetLink() =>
      _selectImageAndGetLink(SelectImageSource.camera);

  Future<String> _selectImageAndGetLink(
    SelectImageSource selectCategory,
  ) async {
    try {
      final requestStatus = switch (selectCategory) {
        SelectImageSource.gallery =>
          await permissionClient.requestGalleryPermission(),
        SelectImageSource.camera =>
          await permissionClient.requestCameraPermission(),
      };

      switch (requestStatus) {
        case CustomPermissionStatus.granted:
          {
            final image = await ImagePicker().pickImage(
              source: switch (selectCategory) {
                SelectImageSource.gallery => ImageSource.gallery,
                SelectImageSource.camera => ImageSource.camera,
              },
            );
            if (image == null) return '';

            final imageFile = File(image.path);
            final imageLink = await storageClient.uploadImageAndGetUrl(
              uid: authClient.getUserId,
              imageFile: imageFile,
            );

            authClient.updatePhotoURL(imageLink);
            return imageLink;
          }
        case CustomPermissionStatus.denied:
          throw const DeniedException(
            'Allow access to the gallery in a pop-up window',
          );
        case CustomPermissionStatus.permanentlyDenied:
          throw const PermanentlyDeniedException(
            'Allow access to the gallery in the device settings',
          );
      }
    } on FirebaseException catch (e) {
      final errorMessage = FirebaseExceptions.fromFirebaseError(e).message;
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
