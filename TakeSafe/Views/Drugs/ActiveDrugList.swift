//
//  ActiveDrugList.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-18.
//

import SwiftUI

struct ActiveDrugList: View {
    @ObservedObject var activeDrugs: ActiveDrugs
    
    var body: some View {
        List {
            ForEach(activeDrugs.items) { activeDrug in
                ActiveDrugListItem(activeDrug: activeDrug)
                    .environmentObject(activeDrugs)
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { (index) in
                    let drug = activeDrugs.items[index]

                    DrugManager.removeActiveDrug(activeDrug: drug)
                    activeDrugs.items.remove(at: index)
                }
            })
        }
        .listStyle(InsetGroupedListStyle())
    }
}
