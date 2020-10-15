//
//  UnitMassExtension.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-15.
//

import Foundation

extension UnitMass {
    func string() -> String? {
        switch self {
            case .milligrams:
                return "milligrams"
            case .kilograms:
                return "kilograms"
            default:
                return nil
        }
    }
}
