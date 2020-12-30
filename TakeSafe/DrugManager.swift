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

        schedulePhaseNotifications(activeDrug: activeDrug)
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
        
        return activeDrugs.filter { !$0.excreted() }
    }

    private static func schedulePhaseNotifications(activeDrug: ActiveDrug) {
        guard let duration = activeDrug.administrationRoute.duration else {
            return
        }

        for durationComponent in duration.filter({ $0.type != .total && $0.type != .afterEffects }) {
            schedulePhaseNotification(activeDrug: activeDrug, durationComponent: durationComponent)
        }
    }

    private static func schedulePhaseNotification(activeDrug: ActiveDrug, durationComponent: DurationComponent) {
        let identifier = notificationId(activeDrug: activeDrug, phase: durationComponent.type)
        let content = UNMutableNotificationContent()

        content.title = activeDrug.name
        content.subtitle = "\(durationComponent.type.rawValue)".localized()
        content.body = "TODO.".localized()

        #if DEBUG
        let timeInterval: Double = 5
        #else
        let start = durationComponent.start
        let end = durationComponent.end
        let timeInterval: Double = abs(end - start) * 3600
        #endif

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)

        NotificationManager.shared.schedule(withIdentifier: identifier, content: content, trigger: trigger, completion: { _ in })
    }

    private static func notificationId(activeDrug: ActiveDrug, phase: DurationType) -> String {
        return "\(activeDrug.id)-\(activeDrug.ingestion.timeIntervalSince1970)-\(phase.rawValue)"
    }

    private static func notificationIdentifiers(activeDrug: ActiveDrug) -> [String] {
        var identifiers: [String] = []

        for phase in DurationType.allCases {
            identifiers.append(notificationId(activeDrug: activeDrug, phase: phase))
        }

        return identifiers
    }

    private static func cancelNotifications(activeDrug: ActiveDrug) {
        NotificationManager.shared.cancel(withIdentifiers: notificationIdentifiers(activeDrug: activeDrug))
    }
}
