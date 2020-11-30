//
//  AdministrationRoute.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-18.
//

import SwiftUI

struct AdministrationRoute: Codable, Identifiable, Hashable {
    let id: String
    let bioavailability: Int
    let duration: [Duration]?
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(id) }
    
    enum CodingKeys: String, CodingKey {
        case id
        case bioavailability
        case duration
    }
    
    init(id: String, bioavailability: Int, duration: [Duration]?) {
        self.id = id
        self.bioavailability = bioavailability
        self.duration = duration
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        bioavailability = try container.decode(Int.self, forKey: .bioavailability)
        duration = try container.decodeIfPresent([Duration].self, forKey: .duration)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(bioavailability, forKey: .bioavailability)
        try container.encodeIfPresent(duration, forKey: .duration)
    }
}
