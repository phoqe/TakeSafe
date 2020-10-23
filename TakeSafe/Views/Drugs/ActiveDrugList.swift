//
//  ActiveDrugList.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-18.
//

import SwiftUI

struct ActiveDrugList: View {
    @State var activeDrugs: [ActiveDrug]
    
    var body: some View {
        List {
            ForEach(activeDrugs) { activeDrug in
                ActiveDrugListItem(activeDrug: activeDrug)
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { (index) in
                    let drug = activeDrugs[index]
                    
                    DrugManager.removeActiveDrug(id: drug.id)
                    activeDrugs.remove(at: index)
                }
            })
        }
        .listStyle(InsetGroupedListStyle())
    }
}
