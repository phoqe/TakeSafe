//
//  LD50.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-14.
//

import Foundation

struct LD50: Decodable {
    let value: Int
    let unit: UnitMass
    
    enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        value = try container.decode(Int.self, forKey: .value)
        unit = try container.decode(String.self, forKey: .unit).unitMass()!
    }
}
