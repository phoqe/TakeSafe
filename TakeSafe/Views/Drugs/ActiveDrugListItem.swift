//
//  ActiveDrugListItem.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-17.
//

import SwiftUI

struct ActiveDrugListItem: View {
    var activeDrug: ActiveDrug

    @EnvironmentObject var activeDrugs: ActiveDrugs
    
    var body: some View {
        NavigationLink(destination: ActiveDrugView(activeDrug: activeDrug).environmentObject(activeDrugs)) {
            IconImage(icon: activeDrug.icon)
                .padding(.trailing, 7.5)
            
            VStack(alignment: .leading) {
                Text(activeDrug.name)
                    .bold()
                    .foregroundColor(.accentColor)
                    .padding(.bottom, -2.5)
                
                Text("\(activeDrug.dose) \(activeDrug.massUnit.symbol) \u{00B7} \(activeDrug.administrationRoute.id.localized())")
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: true, vertical: false)
            }
            
            Spacer()
            
            Text(activeDrug.ingestion, style: .timer)
                .foregroundColor(.secondary)
        }
        .padding(.vertical)
    }
}
