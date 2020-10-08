//
//  Drug.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import Foundation

struct Drug {
    let name: String
    let aliases: [String]?
    let description: String
    let learnMoreUrl: String
    
    let dependence: Dependence
    let addiction: Addiction
    
    let bioavailability: Double
    let drugClass: DrugClass
    
    let onset: DateComponents
    let duration: DateComponents
    
    let massUnit: UnitMass
    
    let ld50: Measurement<UnitMass>
    let defaultDose: Int
    let doseStep: Int
    let commonDoses: [Int]
}
