//
//  Icon.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-17.
//

import Foundation

enum Icon: String, Codable {
    case energy
    case vision
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let icon = try container.decode(String.self)
        
        switch icon {
            case "energy":
                self = .energy
            case "vision":
                self = .vision
            default:
                fatalError()
        }
    }
    
    func imageName() -> String {
        switch self {
            case .energy:
                return "Energy"
            case .vision:
                return "Vision"
        }
    }
}
