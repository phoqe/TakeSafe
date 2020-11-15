//
//  DrugInteractionSeverity.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-22.
//

import SwiftUI

enum DrugInteractionSeverity: String, Codable, Comparable {
    case minor
    case moderate
    case major
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }

    private var priority: Int {
        switch self {
            case .minor:
                return 0
            case .moderate:
                return 1
            case .major:
                return 2
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let severity = try container.decode(String.self)
        
        switch severity {
            case "minor":
                self = .minor
                
            case "moderate":
                self = .moderate
                
            case "major":
                self = .major
            
            default:
                fatalError()
        }
    }

    static func ==(lhs: DrugInteractionSeverity, rhs: DrugInteractionSeverity) -> Bool {
        return lhs.priority == rhs.priority
    }

    static func <(lhs: DrugInteractionSeverity, rhs: DrugInteractionSeverity) -> Bool {
        return lhs.priority < rhs.priority
    }

    func localizedPrompt() -> String {
        switch self {
            case .minor:
                return "Be watchful with this combination.".localized()
            case .moderate:
                return "Be cautious with this combination.".localized()
            case .major:
                return "Do not take this combination.".localized()
        }
    }
}
