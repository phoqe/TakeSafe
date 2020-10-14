//
//  DrugClass.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import Foundation

enum DrugClass: String, Codable {
    case stimulant = "Stimulant"
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let drugClass = try container.decode(String.self)
        
        switch drugClass {
            case "stimulant":
                self = .stimulant
            default:
                fatalError()
        }
    }
}
