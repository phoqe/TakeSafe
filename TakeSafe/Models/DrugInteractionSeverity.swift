//
//  DrugInteractionSeverity.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-22.
//

import SwiftUI

enum DrugInteractionSeverity: String, Codable {
    case minor
    case moderate
    case major
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    
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
}
