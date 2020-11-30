//
//  DurationType.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-29.
//

import SwiftUI

enum DurationType: String, Codable {
    case total
    case onset
    case comeUp
    case peak
    case offset
    case afterEffects

    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let durationType = try container.decode(String.self)

        switch durationType {
            case "total":
                self = .total

            case "onset":
                self = .onset

            case "come_up":
                self = .comeUp

            case "peak":
                self = .peak

            case "offset":
                self = .offset

            case "after_effects":
                self = .afterEffects

            default:
                fatalError()
        }
    }
}
