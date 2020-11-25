//
//  LD50.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-14.
//

import Foundation

struct LD50: Codable {
    let value: Double
    let unitDividend: UnitMass
    let unitDivisor: UnitMass
    let animal: String
    let route: String

    enum CodingKeys: String, CodingKey {
        case value
        case unitDividend = "unit_dividend"
        case unitDivisor = "unit_divisor"
        case animal
        case route
    }
    
    init(value: Double, unitDividend: UnitMass, unitDivisor: UnitMass, animal: String, route: String) {
        self.value = value
        self.unitDividend = unitDividend
        self.unitDivisor = unitDivisor
        self.animal = animal
        self.route = route
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        value = try container.decode(Double.self, forKey: .value)
        unitDividend = try container.decode(String.self, forKey: .unitDividend).unitMass()!
        unitDivisor = try container.decode(String.self, forKey: .unitDivisor).unitMass()!
        animal = try container.decode(String.self, forKey: .animal)
        route = try container.decode(String.self, forKey: .route)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(value, forKey: .value)
        try container.encode(unitDividend.string(), forKey: .unitDividend)
        try container.encode(unitDivisor.string(), forKey: .unitDivisor)
        try container.encode(animal, forKey: .animal)
        try container.encode(route, forKey: .route)
    }
}
