//
//  ActiveDrugList.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-18.
//

import SwiftUI

struct ActiveDrugList: View {
    @Binding var activeDrugs: [ActiveDrug]
    
    var body: some View {
        List {
            ForEach(activeDrugs) { activeDrug in
                ActiveDrugListItem(activeDrug: activeDrug)
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}
