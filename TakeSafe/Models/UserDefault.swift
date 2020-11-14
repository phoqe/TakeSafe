//
//  UserDefault.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-14.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefault<T> {
    let key: String

    init(_ key: String) {
        self.key = key
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as! T
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
