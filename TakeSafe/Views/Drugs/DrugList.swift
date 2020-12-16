//
//  DrugList.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-14.
//

import SwiftUI

struct DrugList: View {
    var stimulants: [Drug]
    var hallucinogens: [Drug]

    init(drugs: [Drug]) {
        self.stimulants = drugs.filter { $0.drugClass == .stimulant }
        self.hallucinogens = drugs.filter { $0.drugClass == .hallucinogen }
    }

    var body: some View {
        List {
            HStack(spacing: 20) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.orange)
                
                Text("Always consult a physician before administering a new drug.")
                    .bold()
                    .foregroundColor(.orange)
            }
            .padding(.vertical, 10)
            
            if !hallucinogens.isEmpty {
                Section(header: Text("Hallucinogens").textCase(.none)) {
                    ForEach(hallucinogens) { hallucinogen in
                        DrugListItem(drug: hallucinogen)
                    }
                }
            }
            
            if !stimulants.isEmpty {
                Section(header: Text("Stimulants").textCase(.none)) {
                    ForEach(stimulants) { stimulant in
                        DrugListItem(drug: stimulant)
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct DrugList_Previews: PreviewProvider {
    static var previews: some View {
        DrugList(drugs: [SampleData.drug])
    }
}
