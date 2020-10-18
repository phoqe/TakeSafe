//
//  Addiction.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import SwiftUI

enum Addiction: String, Codable {
    case low = "addictionLow"
    case moderate = "addictionModerate"
    case high = "addictionHigh"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let addiction = try container.decode(String.self)
        
        switch addiction {
            case "low", "addictionLow":
                self = .low
            case "moderate", "addictionModerate":
                self = .moderate
            case "high", "addictionHigh":
                self = .high
            default:
                fatalError()
        }
    }
}
