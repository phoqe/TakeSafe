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
            Text(drug.drugClass.rawValue)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 5)
    }
}
