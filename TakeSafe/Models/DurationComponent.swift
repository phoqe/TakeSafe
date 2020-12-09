//
//  DurationComponent.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-29.
//

import Foundation

struct DurationComponent: Codable, Hashable {
    let type: DurationType
    let start: TimeInterval
    let end: TimeInterval

    enum CodingKeys: String, CodingKey {
        case type
        case start
        case end
    }

    init(type: DurationType, start: Double, end: Double) {
        self.type = type
        self.start = start
        self.end = end
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(DurationType.self, forKey: .type)
        start = try container.decode(TimeInterval.self, forKey: .start)
        end = try container.decode(TimeInterval.self, forKey: .end)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(start, forKey: .start)
        try container.encode(end, forKey: .end)
    }
    
    func interval() -> DateInterval {
        let startDate = Date(timeInterval: start, since: Date())
        let endDate = Date(timeInterval: end, since: startDate)
        
        return DateInterval(start: startDate, end: endDate)
    }
}
