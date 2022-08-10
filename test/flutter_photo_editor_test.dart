import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_photo_editor/flutter_photo_editor.dart';
import 'package:flutter_photo_editor/flutter_photo_editor_platform_interface.dart';
import 'package:flutter_photo_editor/flutter_photo_editor_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockFlutterPhotoEditorPlatform
//     with MockPlatformInterfaceMixin
//     implements FlutterPhotoEditorPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final FlutterPhotoEditorPlatform initialPlatform = FlutterPhotoEditorPlatform.instance;
//
//   test('$MethodChannelFlutterPhotoEditor is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelFlutterPhotoEditor>());
//   });
//
//   test('getPlatformVersion', () async {
//     FlutterPhotoEditor flutterPhotoEditorPlugin = FlutterPhotoEditor();
//     MockFlutterPhotoEditorPlatform fakePlatform = MockFlutterPhotoEditorPlatform();
//     FlutterPhotoEditorPlatform.instance = fakePlatform;
//
//     expect(await flutterPhotoEditorPlugin.getPlatformVersion(), '42');
//   });
// }
