//
//  InteractionList.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-14.
//

import SwiftUI

struct InteractionList: View {
    var interactions: [DrugInteraction]

    var body: some View {
        List {
            WarningText(content: "Always consult a physician before administering a new drug.")

            ForEach(interactions.sorted { $0.severity > $1.severity }) { interaction in
                InteractionListItem(interaction: interaction)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle("Interactions", displayMode: .inline)
    }
}

struct InteractionList_Previews: PreviewProvider {
    static var previews: some View {
        InteractionList(interactions: [SampleData.minorInteraction, SampleData.moderateInteraction, SampleData.majorInteraction])
    }
}
