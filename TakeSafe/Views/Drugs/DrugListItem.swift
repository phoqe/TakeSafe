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
        VStack(alignment: .leading) {
            Text(drug.name)
                .padding(.bottom, -5)
            Text(drug.drugClass.localizedName)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 5)
    }
}
