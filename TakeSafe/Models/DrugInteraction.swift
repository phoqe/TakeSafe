//
//  DrugInteraction.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-22.
//

import Foundation

struct DrugInteraction: Codable, Identifiable {
    let id: String
    let name: String
    let severity: DrugInteractionSeverity
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case severity
        case description
    }
    
    init(id: String, name: String, severity: DrugInteractionSeverity, description: String) {
        self.id = id
        self.name = name
        self.severity = severity
        self.description = description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        severity = try container.decode(DrugInteractionSeverity.self, forKey: .severity)
        description = try container.decode(String.self, forKey: .description)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(severity, forKey: .severity)
        try container.encode(description, forKey: .description)
    }
}
