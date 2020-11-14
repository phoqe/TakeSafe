//
//  Settings.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-14.
//

import Foundation
import Combine

class Settings: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()

    @UserDefault("pregnancyMode")
    var pregnancyMode: Bool {
        willSet {
            objectWillChange.send()
        }
    }

    @UserDefault("bedtime")
    var bedtime: Date {
        willSet {
            objectWillChange.send()
        }
    }

    @UserDefault("waketime")
    var waketime: Date {
        willSet {
            objectWillChange.send()
        }
    }
}
