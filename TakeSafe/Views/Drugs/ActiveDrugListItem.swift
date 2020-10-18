//
//  ActiveDrugListItem.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-17.
//

import SwiftUI

struct ActiveDrugListItem: View {
    var activeDrug: ActiveDrug
    
    var body: some View {
        NavigationLink(destination: Text(activeDrug.name)) {
            IconImage(icon: activeDrug.icon)
                .padding(.trailing, 7.5)
            
            VStack(alignment: .leading) {
                Text(activeDrug.name)
                    .bold()
                    .foregroundColor(.accentColor)
                    .padding(.bottom, -2.5)
                
                Text("\(activeDrug.dose) \(activeDrug.massUnit.symbol)")
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(activeDrug.ingestion, style: .timer)
                .foregroundColor(.secondary)
        }
        .padding(.vertical)
    }
}

struct ActiveDrugListItem_Previews: PreviewProvider {
    static var previews: some View {
        ActiveDrugListItem(activeDrug: SampleData.activeDrug)
    }
}
