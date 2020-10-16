//
//  Addiction.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import Foundation

enum Addiction: String, Codable {
    case low
    case moderate
    case high
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let addiction = try container.decode(String.self)
        
        switch addiction {
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
    
    func localizedName() -> String {
        switch self {
            case .low:
                return NSLocalizedString("addictionLow", comment: "")
            case .moderate:
                return NSLocalizedString("addictionModerate", comment: "")
            case .high:
                return NSLocalizedString("addictionHigh", comment: "")
        }
    }
}
