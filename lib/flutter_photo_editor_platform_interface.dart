import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_photo_editor_method_channel.dart';

abstract class FlutterPhotoEditorPlatform extends PlatformInterface {
  /// Constructs a FlutterPhotoEditorPlatform.
  FlutterPhotoEditorPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPhotoEditorPlatform _instance = MethodChannelFlutterPhotoEditor();

  /// The default instance of [FlutterPhotoEditorPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPhotoEditor].
  static FlutterPhotoEditorPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPhotoEditorPlatform] when
  /// they register themselves.
  static set instance(FlutterPhotoEditorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> editImage(String path);


  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
