//
//  Bioavailability.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-12-16.
//

import Foundation

struct Bioavailability: Codable, Hashable {
    let start: Int
    let end: Int
    
    enum CodingKeys: String, CodingKey {
        case start
        case end
    }
    
    init(start: Int, end: Int) {
        self.start = start
        self.end = end
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        start = try container.decode(Int.self, forKey: .start)
        end = try container.decode(Int.self, forKey: .end)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(start, forKey: .start)
        try container.encode(end, forKey: .end)
    }
    
    func bioavailabilityPercentageString() -> String {
        if start == end {
            return "\(start)%"
        }
        
        return "\(start)–\(end)%"
    }
}
