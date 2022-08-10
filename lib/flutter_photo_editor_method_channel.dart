import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_photo_editor_platform_interface.dart';

/// An implementation of [FlutterPhotoEditorPlatform] that uses method channels.
class MethodChannelFlutterPhotoEditor extends FlutterPhotoEditorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_photo_editor');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> editImage(String path) async {
    await methodChannel.invokeMethod('editImage', path);
  }
}
