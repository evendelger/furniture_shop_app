import 'package:firebase_storage/firebase_storage.dart';

class StorageClient {
  StorageClient();

  final _storage = FirebaseStorage.instance;

  dynamic get _profileImagesRef => _storage.ref().child('profile_pictures');
}
