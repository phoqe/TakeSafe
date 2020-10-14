//
//  StringExtensions.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-14.
//

import Foundation

extension String {
    func unitMass() -> UnitMass? {
        if self == "milligrams" {
            return UnitMass.milligrams
        }
        
        return nil
    }
}
