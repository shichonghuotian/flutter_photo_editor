
import 'dart:io';

import 'flutter_photo_editor_platform_interface.dart';

class FlutterPhotoEditor {
  Future<String?> getPlatformVersion() {
    return FlutterPhotoEditorPlatform.instance.getPlatformVersion();
  }

  //编辑图片
  Future<bool> editImage(String path) async {
    final time1 = await File(path).lastModified();
    await FlutterPhotoEditorPlatform.instance.editImage(path);
    final time2 = await File(path).lastModified();
    return time1 != time2;
  }

}
