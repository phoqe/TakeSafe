//
//  Drug.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import Foundation

struct Drug: Codable, Identifiable {
    let id: String
    let name: String
    let aliases: [String]?
    let description: String
    let learnMoreUrl: String
    
    let dependence: String
    let addiction: String
    
    let bioavailability: Int
    let drugClass: String
    
    let onset: Int
    let duration: Int
    
    let massUnit: String
    
    let ld50: Int
    let defaultDose: Int
    let doseStep: Int
    let commonDoses: [Int]
}
