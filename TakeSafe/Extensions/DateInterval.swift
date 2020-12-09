//
//  DateInterval.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-12-09.
//

import Foundation

extension DateInterval {
    func format() -> String {
        let formatter = DateIntervalFormatter()

        formatter.dateStyle = .none
        formatter.timeStyle = .short
        
        return formatter.string(from: self)!
    }
}
