//
//  DrugListItem.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-13.
//

import SwiftUI

struct DrugListItem: View {
    var drug: Drug
    
    var body: some View {
        NavigationLink(destination: DrugView(drug: drug)) {
            IconImage(icon: drug.icon)
                .padding(.trailing, 7.5)
            
            VStack(alignment: .leading) {
                Text(drug.name)
                    .bold()
                    .padding(.bottom, -2.5)

                DrugInfo(drug: drug)
            }
        }
        .padding(.vertical)
    }
}
