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
    let learnMoreUrl: URL
    
    let drugClass: DrugClass
    let dependence: Dependence
    let addiction: Addiction
        
    let onset: Double
    let duration: Double
    
    let massUnit: UnitMass
    let bioavailability: Int
    let ld50: LD50
    let defaultDose: Int
    let doseStep: Int
    let commonDoses: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case aliases
        case description
        case learnMoreUrl = "learn_more_url"
        
        case drugClass = "drug_class"
        case dependence
        case addiction
        
        case onset
        case duration
        
        case massUnit = "mass_unit"
        case bioavailability
        case ld50 = "ld_50"
        case defaultDose = "default_dose"
        case doseStep = "dose_step"
        case commonDoses = "common_doses"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        aliases = try container.decode([String].self, forKey: .aliases)
        description = try container.decode(String.self, forKey: .description)
        learnMoreUrl = try container.decode(URL.self, forKey: .learnMoreUrl)
        
        drugClass = try container.decode(DrugClass.self, forKey: .drugClass)
        dependence = try container.decode(Dependence.self, forKey: .dependence)
        addiction = try container.decode(Addiction.self, forKey: .addiction)
        
        onset = try container.decode(Double.self, forKey: .onset)
        duration = try container.decode(Double.self, forKey: .duration)
        
        massUnit = try container.decode(String.self, forKey: .massUnit).unitMass()!
        bioavailability = try container.decode(Int.self, forKey: .bioavailability)
        ld50 = try container.decode(LD50.self, forKey: .ld50)
        defaultDose = try container.decode(Int.self, forKey: .defaultDose)
        doseStep = try container.decode(Int.self, forKey: .doseStep)
        commonDoses = try container.decode([Int].self, forKey: .commonDoses)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(aliases, forKey: .aliases)
        try container.encode(description, forKey: .description)
        try container.encode(learnMoreUrl, forKey: .learnMoreUrl)
        
        try container.encode(drugClass, forKey: .drugClass)
        try container.encode(dependence, forKey: .dependence)
        try container.encode(addiction, forKey: .addiction)
        
        try container.encode(onset, forKey: .onset)
        try container.encode(duration, forKey: .duration)
        
        try container.encode(massUnit.string(), forKey: .massUnit)
        try container.encode(bioavailability, forKey: .bioavailability)
        try container.encode(ld50, forKey: .ld50)
        try container.encode(defaultDose, forKey: .defaultDose)
        try container.encode(doseStep, forKey: .doseStep)
        try container.encode(commonDoses, forKey: .commonDoses)
    }
}
