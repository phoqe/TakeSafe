//
//  HealthManager.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-19.
//

import HealthKit

struct HealthManager {
    let healthStore: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = nil
            
            return
        }
        
        healthStore = HKHealthStore()
    }
}
