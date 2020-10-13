//
//  Dependence.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import Foundation

enum Dependence: String, Codable {
    case low = "Low"
    case unknown = "Unknown"
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dependence = try container.decode(String.self)
        
        switch dependence {
            case "low":
                self = .low
            default:
                self = .unknown
        }
    }
}
