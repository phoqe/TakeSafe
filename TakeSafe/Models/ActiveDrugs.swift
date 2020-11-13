//
//  ActiveDrugs.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-12.
//

import Foundation

class ActiveDrugs: ObservableObject {
    @Published var items: [ActiveDrug]

    init(items: [ActiveDrug]) {
        self.items = items
    }

    func get() {
        if let activeDrugs = DrugManager.activeDrugs() {
            self.items = activeDrugs
        }
    }
}
