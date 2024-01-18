//
//  TimerAppApp.swift
//  TimerApp
//
//  Created by Sameer Personal on 1/5/24.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            // Ask for notification permission
        NotificationManager.shared.requestAuthorization()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
}

@main
struct TimerAppApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            TimerView()
        }
    }
}
