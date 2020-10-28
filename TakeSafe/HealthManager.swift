//
//  HealthManager.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-19.
//

import HealthKit

struct HealthManager {
    static let shared = HealthManager()
    
    let healthStore: HKHealthStore?
    
    init() {
        if !HKHealthStore.isHealthDataAvailable() {
            healthStore = nil
            
            return
        }
        
        healthStore = HKHealthStore()
    }
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        guard let healthStore = healthStore else {
            return
        }
        
        let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth)
        let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex)
        
        let height = HKObjectType.quantityType(forIdentifier: .height)
        let bodyMass = HKObjectType.quantityType(forIdentifier: .bodyMass)
        let heartRate = HKObjectType.quantityType(forIdentifier: .heartRate)
        let restingHeartRate = HKObjectType.quantityType(forIdentifier: .restingHeartRate)
        let walkingHearRateAverage = HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage)
        let heartRateVariabilitySDNN = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)
        let bodyTemperature = HKObjectType.quantityType(forIdentifier: .bodyTemperature)
        
        let types = Set([
            dateOfBirth!,
            biologicalSex!,
            
            height!,
            bodyMass!,
            heartRate!,
            restingHeartRate!,
            walkingHearRateAverage!,
            heartRateVariabilitySDNN!,
            bodyTemperature!
        ])
        
        healthStore.requestAuthorization(toShare: nil, read: types) { (success, error) in
            if error == nil && success {
                UserDefaults.standard.setValue(true, forKey: "appleHealthConnected")
            } else {
                UserDefaults.standard.setValue(false, forKey: "appleHealthConnected")
            }
            
            completion(success, error)
        }
    }
}
