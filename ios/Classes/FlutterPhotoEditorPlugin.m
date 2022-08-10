#import "FlutterPhotoEditorPlugin.h"
#if __has_include(<flutter_photo_editor/flutter_photo_editor-Swift.h>)
#import <flutter_photo_editor/flutter_photo_editor-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_photo_editor-Swift.h"
#endif

@implementation FlutterPhotoEditorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPhotoEditorPlugin registerWithRegistrar:registrar];
}
@end
