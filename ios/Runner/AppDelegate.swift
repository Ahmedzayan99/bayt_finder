import Flutter
import UIKit
import GoogleMaps
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  //OneSignal.initialize("19925829-8f15-4409-945b-17c91431a2cc", withLaunchOptions: launchOptions)
    GMSServices.provideAPIKey("AIzaSyAoUYOX-bBnqGmPDaTS9z4QhEd4bhNsKvw")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
