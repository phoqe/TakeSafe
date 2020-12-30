//
//  DurationType.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-29.
//

import SwiftUI

enum DurationType: String, Codable, CaseIterable {
    case total
    case onset
    case comeUp
    case peak
    case offset
    case afterEffects

    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    var localizedDescription: LocalizedStringKey { LocalizedStringKey("\(rawValue)-description") }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let durationType = try container.decode(String.self)

        switch durationType {
            case "total":
                self = .total

            case "onset":
                self = .onset

            case "comeUp", "come_up":
                self = .comeUp

            case "peak":
                self = .peak

            case "offset":
                self = .offset

            case "afterEffects", "after_effects":
                self = .afterEffects

            default:
                fatalError()
        }
    }

    func foregroundColor() -> Color? {
        switch self {
            case .total:
                return nil
            case .onset:
                return .blue
            case .comeUp:
                return .orange
            case .peak:
                return .red
            case .offset:
                return .yellow
            case .afterEffects:
                return .purple
        }
    }
}
