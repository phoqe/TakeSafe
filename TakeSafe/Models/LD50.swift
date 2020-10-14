//
//  LD50.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-14.
//

import Foundation

struct LD50: Codable {
    let value: Int
    let unit: String
    
    enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
}
