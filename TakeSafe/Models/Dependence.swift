//
//  Dependence.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import Foundation

enum Dependence: String, Codable {
    case low
    case moderate
    case high
    
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
    
    func localizedString() -> String {
        switch self {
            case .low:
                return NSLocalizedString("dependenceLow", comment: "")
            case .moderate:
                return NSLocalizedString("dependenceModerate", comment: "")
            case .high:
                return NSLocalizedString("dependenceHigh", comment: "")
        }
    }
}
