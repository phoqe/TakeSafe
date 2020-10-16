//
//  DrugManager.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-16.
//

import Foundation

struct DrugManager {
    static let activeDrugsUserDefaultsKey = "activeDrugs"
    
    static func addDrug(drug: Drug) {
        let encoder = JSONEncoder()
        
        if let data = UserDefaults.standard.data(forKey: activeDrugsUserDefaultsKey) {
            let decoder = JSONDecoder()
            
            guard var oldActiveDrugs = try? decoder.decode([Drug].self, from: data) else {
                return
            }
            
            oldActiveDrugs.append(drug)
            
            guard let newActiveDrugs = try? encoder.encode(oldActiveDrugs) else {
                return
            }
            
            UserDefaults.standard.set(newActiveDrugs, forKey: activeDrugsUserDefaultsKey)
        } else {
            guard let newActiveDrugs = try? encoder.encode([drug]) else {
                return
            }
            
            UserDefaults.standard.set(newActiveDrugs, forKey: activeDrugsUserDefaultsKey)
        }
    }
    
    static func activeDrugs() -> [Drug]? {
        let decoder = JSONDecoder()
        
        guard let data = UserDefaults.standard.data(forKey: activeDrugsUserDefaultsKey) else {
            return nil
        }
        
        guard let activeDrugs = try? decoder.decode([Drug].self, from: data) else {
            return nil
        }
        
        return activeDrugs
    }
}
