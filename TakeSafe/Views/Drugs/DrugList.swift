//
//  DrugList.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-14.
//

import SwiftUI

struct DrugList: View {
    var drugs: [Drug]
    
    var body: some View {
        List(drugs) { drug in
            NavigationLink(destination: DrugView(drug: drug)) {
                DrugListItem(drug: drug)
            }
        }
    }
}
