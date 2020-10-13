//
//  Addiction.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import Foundation

enum Addiction: String, Codable {
    case low = "Low"
    case unknown = "Unknown"
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let addiction = try container.decode(String.self)
        
        switch addiction {
        case "low":
            self = .low
        default:
            self = .unknown
        }
    }
}
