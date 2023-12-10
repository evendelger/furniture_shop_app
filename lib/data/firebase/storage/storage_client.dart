import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageClient {
  const StorageClient();

  static final _storage = FirebaseStorage.instance;

  Reference get _profileImagesRef => _storage.ref().child('profile_pictures');

  String _imageStorageName(String uid) => '/${uid}_avatar';

  // Future<String?> getImageUrl({required String uid}) async {
  //   try {
  //     final imageRef = _profileImagesRef.child(_imageStorageName(uid));
  //     final imageUrl = await imageRef.getDownloadURL();
  //     return imageUrl;
  //   } catch (e) {
  //     locator<Talker>().error(e);
  //     return null;
  //   }
  // }

  Future<String> uploadImageAndGetUrl({
    required String uid,
    required File imageFile,
  }) async {
    try {
      final imageRef = _profileImagesRef.child(_imageStorageName(uid));
      final uploadTask = await imageRef.putFile(
        imageFile,
        SettableMetadata(contentType: 'image/png'),
      );
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }
}
