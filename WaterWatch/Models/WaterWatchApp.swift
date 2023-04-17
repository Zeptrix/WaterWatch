//
//  WaterWatchApp.swift
//  WaterWatch
//
//  Created by Nathan Aronson (student LM) on 3/2/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct WaterWatchApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  @StateObject var userInfo: UserInfo = UserInfo()

  var body: some Scene {
    WindowGroup {
      NavigationView {
          ContentView(remindersPerDay: Binding.constant(0.0), drinkSize: Binding.constant(0.0))
              .environmentObject(userInfo)
      }
    }
  }
}
