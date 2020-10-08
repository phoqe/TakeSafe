//
//  TakeDrugView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-07.
//

import SwiftUI
import Foundation

struct TakeDrugView: View {
    var drug: Drug
    
    @State var dosage = 0
    @State var showMedianLethalDoseAlert = false
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Median lethal dose")
                        .bold()
                    Spacer()
                    Text("\(Int(round(drug.medianLethalDose.value))) \(drug.medianLethalDose.unit.symbol)/\(UnitMass.kilograms.symbol)")
                    Button(action: {
                        showMedianLethalDoseAlert = true
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .alert(isPresented: $showMedianLethalDoseAlert) {
                        Alert(title: Text("Median lethal dose"), message: Text("The median lethal dose for a substance is the dose required to kill half the members of a tested population after a specified test duration."), dismissButton: .default(Text("OK")))
                    }
                }
                
                HStack {
                    Text("Dosage")
                        .bold()
                    Stepper("\(dosage) \(drug.massUnit.symbol)", value: $dosage, in: 0...400, step: 50)
                }
                .padding(.vertical)
            }
            .navigationBarTitle(Text("Take \(drug.name)"), displayMode: .inline)
        }
    }
}
