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

    // Characteristic Types
    let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth)
    let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex)

    // Quantity Types
    let height = HKObjectType.quantityType(forIdentifier: .height)
    let bodyMass = HKObjectType.quantityType(forIdentifier: .bodyMass)
    let heartRate = HKObjectType.quantityType(forIdentifier: .heartRate)
    let restingHeartRate = HKObjectType.quantityType(forIdentifier: .restingHeartRate)
    let walkingHearRateAverage = HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage)
    let heartRateVariabilitySDNN = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)
    let bodyTemperature = HKObjectType.quantityType(forIdentifier: .bodyTemperature)

    let types: Set<HKObjectType>
    
    init() {
        types = Set([
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
