//
//  Dependence.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import SwiftUI

enum Dependence: String, Codable {
    case low = "dependenceLow"
    case moderate = "dependenceModerate"
    case high = "dependenceHigh"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dependence = try container.decode(String.self)
        
        switch dependence {
            case "low":
                self = .low
            case "moderate":
                self = .moderate
            case "high":
                self = .high
            default:
                fatalError()
        }
    }
}
