//
//  TimeInterval.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-12-09.
//

import Foundation

extension TimeInterval {
    func format(using allowedUnits: NSCalendar.Unit) -> String {
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = allowedUnits
        formatter.unitsStyle = .abbreviated
        formatter.maximumUnitCount = 2
        
        return formatter.string(from: self)!
    }
}
