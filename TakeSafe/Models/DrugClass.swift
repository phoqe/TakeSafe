//
//  DrugClass.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import SwiftUI

enum DrugClass: String, Codable {
    case stimulant
    case hallucinogen
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let drugClass = try container.decode(String.self)
        
        switch drugClass {
            case "stimulant":
                self = .stimulant
            case "hallucinogen":
                self = .hallucinogen
            default:
                fatalError()
        }
    }
}
