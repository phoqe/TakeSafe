//
//  NotificationManager.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-03.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationManager()
    
    let center = UNUserNotificationCenter.current()

    override init() {
        super.init()

        center.delegate = self
    }
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        center.requestAuthorization(options: [.alert, .badge, .provisional, .carPlay]) { (granted, error) in
            completion(granted, error)
        }
    }
    
    func schedule(content: UNMutableNotificationContent, trigger: UNNotificationTrigger, completion: @escaping (Error?) -> Void) {
        let identifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .denied {

                return
            }

            self.center.add(request) { (error) in
                completion(error)
            }
        }
    }

    func schedule(withIdentifier identifier: String, content: UNMutableNotificationContent, trigger: UNNotificationTrigger, completion: @escaping (Error?) -> Void) {
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus == .denied {

                return
            }

            self.center.add(request) { (error) in
                completion(error)
            }
        }
    }

    func cancel(withIdentifiers identifiers: [String]) {
        center.removeDeliveredNotifications(withIdentifiers: identifiers)
    }
}
