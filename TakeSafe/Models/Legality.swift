//
//  Legality.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-22.
//

import Foundation

struct Legality: Codable {
    let jurisdiction: String
    let statute: String
    let statuteShort: String

    enum CodingKeys: String, CodingKey {
        case jurisdiction
        case statute
        case statuteShort = "statute_short"
    }

    init(jurisdiction: String, statute: String, statuteShort: String) {
        self.jurisdiction = jurisdiction
        self.statute = statute
        self.statuteShort = statuteShort
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        jurisdiction = try container.decode(String.self, forKey: .jurisdiction)
        statute = try container.decode(String.self, forKey: .statute)
        statuteShort = try container.decode(String.self, forKey: .statuteShort)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(jurisdiction, forKey: .jurisdiction)
        try container.encode(statute, forKey: .statute)
        try container.encode(statuteShort, forKey: .statuteShort)
    }
}
