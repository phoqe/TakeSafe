//
//  NotificationManager.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-03.
//

import Foundation
import UserNotifications

struct NotificationManager {
    static let shared = NotificationManager()
    
    let center = UNUserNotificationCenter.current()
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        center.requestAuthorization(options: [.alert, .badge]) { (granted, error) in
            completion(granted, error)
        }
    }
    
    func schedule(content: UNMutableNotificationContent, trigger: UNNotificationTrigger, completion: @escaping (Error?) -> Void) {
        let identifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request) { (error) in
            completion(error)
        }
    }
}
