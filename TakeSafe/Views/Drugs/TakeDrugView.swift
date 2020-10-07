//
//  TakeDrugView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-07.
//

import SwiftUI

struct TakeDrugView: View {
    var drug: Drug
    
    @State var dosage: String = ""
    
    var body: some View {
        VStack {
            List {
                HStack {
                    TextField("Dosage", text: $dosage)
                        .keyboardType(.decimalPad)
                    Text(drug.massUnit.symbol)
                }
            }
        }
        .navigationBarTitle(Text("Take \(drug.name)"))
    }
}
