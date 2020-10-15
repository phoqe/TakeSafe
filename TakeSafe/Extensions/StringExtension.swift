//
//  StringExtension.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-14.
//

import Foundation

extension String {
    static func unitMassFromString(_ string: String) -> UnitMass? {
        return string.unitMass()
    }
    
    func iso8601Duration() -> DateComponents? {
        return DateComponents.durationFrom8601String(self)
    }
    
    func unitMass() -> UnitMass? {
        if self == "milligrams" {
            return UnitMass.milligrams
        }
        
        return nil
    }
}
