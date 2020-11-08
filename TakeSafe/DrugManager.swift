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
        
        scheduleNotifications(activeDrug: activeDrug) { (granted, error) in
            
        }
    }
    
    static func removeActiveDrug(id: String) {
        guard let data = UserDefaults.standard.data(forKey: activeDrugsUserDefaultsKey) else {
            return
        }
        
        guard let oldActiveDrugs = try? decoder.decode([ActiveDrug].self, from: data) else {
            return
        }
        
        let activeDrugs = oldActiveDrugs.filter { $0.id != id }
        
        guard let newActiveDrugs = try? encoder.encode(activeDrugs) else {
            return
        }
        
        UserDefaults.standard.set(newActiveDrugs, forKey: activeDrugsUserDefaultsKey)
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
    
    private static func scheduleNotifications(activeDrug: ActiveDrug, completion: @escaping (Bool, Error?) -> Void) {
        NotificationManager.shared.requestAuthorization { (granted, error) in
            if !granted || error != nil {
                completion(granted, error)
                
                return
            }
            
            scheduleOnsetNotification(activeDrug: activeDrug) { (error) in
                completion(true, error)
            }
        }
    }
    
    private static func scheduleOnsetNotification(activeDrug: ActiveDrug, completion: @escaping (Error?) -> Void) {
        let content = UNMutableNotificationContent()
        
        content.title = activeDrug.name
        content.subtitle = "Onset".localized()
        content.body = "You’ll start to feel the effects shortly.".localized()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: activeDrug.onset, repeats: false)
        
        NotificationManager.shared.schedule(content: content, trigger: trigger) { (error) in
            completion(error)
        }
    }
}
