//
//  LD50.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-14.
//

import Foundation

struct LD50: Codable {
    let value: Int
    let unitDividend: UnitMass
    let unitDivisor: UnitMass
    
    enum CodingKeys: String, CodingKey {
        case value
        case unitDividend = "unit_dividend"
        case unitDivisor = "unit_divisor"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        value = try container.decode(Int.self, forKey: .value)
        unitDividend = try container.decode(String.self, forKey: .unitDividend).unitMass()!
        unitDivisor = try container.decode(String.self, forKey: .unitDivisor).unitMass()!
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(value, forKey: .value)
        try container.encode(unitDividend.string(), forKey: .unitDividend)
        try container.encode(unitDivisor.string(), forKey: .unitDivisor)
    }
}
