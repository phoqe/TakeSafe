//
//  DrugManager.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-16.
//

import Foundation
import UserNotifications

struct DrugManager {
    private static let encoder = JSONEncoder()
    private static let decoder = JSONDecoder()
    
    static let activeDrugsUserDefaultsKey = "activeDrugs"
    
    static func addActiveDrug(activeDrug: ActiveDrug) {
        if let data = UserDefaults.standard.data(forKey: activeDrugsUserDefaultsKey) {
            guard var oldActiveDrugs = try? decoder.decode([ActiveDrug].self, from: data) else {
                return
            }
            
            oldActiveDrugs.append(activeDrug)
            
            guard let newActiveDrugs = try? encoder.encode(oldActiveDrugs) else {
                return
            }
            
            UserDefaults.standard.set(newActiveDrugs, forKey: activeDrugsUserDefaultsKey)
        } else {
            guard let newActiveDrugs = try? encoder.encode([activeDrug]) else {
                return
            }
            
            UserDefaults.standard.set(newActiveDrugs, forKey: activeDrugsUserDefaultsKey)
        }

        scheduleOnsetNotification(activeDrug: activeDrug)
        scheduleExcretionNotification(activeDrug: activeDrug)
    }
    
    static func removeActiveDrug(activeDrug: ActiveDrug) {
        guard let data = UserDefaults.standard.data(forKey: activeDrugsUserDefaultsKey) else {
            return
        }
        
        guard let oldActiveDrugs = try? decoder.decode([ActiveDrug].self, from: data) else {
            return
        }
        
        let activeDrugs = oldActiveDrugs.filter { $0.id != activeDrug.id }
        
        guard let newActiveDrugs = try? encoder.encode(activeDrugs) else {
            return
        }
        
        UserDefaults.standard.set(newActiveDrugs, forKey: activeDrugsUserDefaultsKey)
        cancelNotifications(activeDrug: activeDrug)
    }
    
    static func activeDrugs() -> [ActiveDrug]? {
        guard let data = UserDefaults.standard.data(forKey: activeDrugsUserDefaultsKey) else {
            return nil
        }
        
        guard let activeDrugs = try? decoder.decode([ActiveDrug].self, from: data) else {
            return nil
        }
        
        return activeDrugs
    }
    
    private static func scheduleOnsetNotification(activeDrug: ActiveDrug) {
        let identifier = notificationId(activeDrug: activeDrug, phase: .onset)
        let content = UNMutableNotificationContent()
        
        content.title = activeDrug.name
        content.subtitle = "Onset".localized()
        content.body = "You’ll start to feel the effects shortly.".localized()

        #if DEBUG
        let timeInterval: Double = 5
        #else
        let timeInterval: Double = activeDrug.onset * 3600
        #endif
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        NotificationManager.shared.schedule(withIdentifier: identifier, content: content, trigger: trigger, completion: { _ in })
    }

    private static func scheduleExcretionNotification(activeDrug: ActiveDrug) {
        let identifier = notificationId(activeDrug: activeDrug, phase: .excretion)
        let content = UNMutableNotificationContent()

        content.title = activeDrug.name
        content.subtitle = "Excretion".localized()
        content.body = "The effects have worn off.".localized()

        #if DEBUG
        let timeInterval: Double = 10
        #else
        let timeInterval: Double = activeDrug.duration * 3600
        #endif

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)

        NotificationManager.shared.schedule(withIdentifier: identifier, content: content, trigger: trigger, completion: { _ in })
    }

    private static func notificationId(activeDrug: ActiveDrug, phase: DrugPhase) -> String {
        return "\(activeDrug.id)-\(activeDrug.ingestion.timeIntervalSince1970)-\(phase.rawValue)"
    }

    private static func notificationIdentifiers(activeDrug: ActiveDrug) -> [String] {
        var identifiers: [String] = []

        for phase in DrugPhase.allCases {
            identifiers.append(notificationId(activeDrug: activeDrug, phase: phase))
        }

        return identifiers
    }

    private static func cancelNotifications(activeDrug: ActiveDrug) {
        NotificationManager.shared.cancel(withIdentifiers: notificationIdentifiers(activeDrug: activeDrug))
    }
}
