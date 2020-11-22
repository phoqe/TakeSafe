//
//  Jurisdiction.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-22.
//

import SwiftUI

enum Jurisdiction: String, Codable {
    case us
    case un

    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let jurisdiction = try container.decode(String.self)

        switch jurisdiction {
            case "US":
                self = .us

            case "UN":
                self = .un

            default:
                fatalError()
        }
    }
}
