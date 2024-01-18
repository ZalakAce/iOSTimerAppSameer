//
//  NotificationHandler.swift
//  TimerApp
//
//  Created by Sameer Personal on 1/7/24.
//

import Foundation
import UserNotifications

final class NotificationManager {
    
    static let shared = NotificationManager()
    
    private init() {
    }

    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func showNotification(title: String, subTitle: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subTitle
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }
}
