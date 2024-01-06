import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let platformChannel = FlutterMethodChannel(name: "platform_channel_example", binaryMessenger: controller.binaryMessenger)
    
    platformChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: FlutterResult) in
      if call.method == "getPlatformVersion" {
        let systemVersion = UIDevice.current.systemVersion
        result("iOS \(systemVersion)")
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
