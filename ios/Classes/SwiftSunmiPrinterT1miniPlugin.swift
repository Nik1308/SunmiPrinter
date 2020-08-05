import Flutter
import UIKit

public class SwiftSunmiPrinterT1miniPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "sunmi_printer_t1mini", binaryMessenger: registrar.messenger())
    let instance = SwiftSunmiPrinterT1miniPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
