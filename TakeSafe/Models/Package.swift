//
//  Package.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-12.
//

import Foundation

struct Package: Identifiable {
    let id: String
    let name: String
    let author: String?
    let license: License
}
