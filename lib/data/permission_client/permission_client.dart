import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

enum CustomPermissionStatus {
  granted,
  denied,
  permanentlyDenied,
}

class PermissionClient {
  const PermissionClient();

  static final _deviceInfoPlugin = DeviceInfoPlugin();

  Future<CustomPermissionStatus> requestGalleryPermission() async {
    PermissionStatus status;

    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        status = await Permission.storage.status;
      } else {
        status = await Permission.photos.request();
      }
    } else {
      status = await Permission.photos.request();
    }

    return _toCustomStatus(status);
  }

  Future<CustomPermissionStatus> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return _toCustomStatus(status);
  }

  CustomPermissionStatus _toCustomStatus(PermissionStatus permStatus) =>
      switch (permStatus) {
        PermissionStatus.denied => CustomPermissionStatus.denied,
        PermissionStatus.granted ||
        PermissionStatus.limited ||
        PermissionStatus.provisional =>
          CustomPermissionStatus.granted,
        PermissionStatus.permanentlyDenied ||
        PermissionStatus.restricted =>
          CustomPermissionStatus.permanentlyDenied,
      };
}
