import Flutter
import UIKit
import ZLImageEditor

public class SwiftFlutterPhotoEditorPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_photo_editor", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPhotoEditorPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
      if call.method == "editImage" {
          editImage(path: call.arguments as? String, result: result)

      }else {
          result("iOS " + UIDevice.current.systemVersion)
//          result(FlutterMethodNotImplemented)

      }
      
  }
    
    private func editImage(path: Any?, result: @escaping FlutterResult) {
      guard let path = path as? String, let image = UIImage(contentsOfFile: path) else {
        result(FlutterError(code: "1", message: "image not found", details: nil))
        return
      }
      ZLEditImageViewController.showEditImageVC(
        parentVC: UIApplication.shared.keyWindow?.rootViewController,
        animate: true,
        image: image,
        editModel: nil
      ) { image, _ in
        try? image
          .jpegData(compressionQuality: 1)?
          .write(to: URL(fileURLWithPath: path))
        result(nil)
      }
    }
}
