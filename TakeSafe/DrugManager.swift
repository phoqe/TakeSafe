//
//  DrugManager.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-16.
//

import Foundation

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
}
