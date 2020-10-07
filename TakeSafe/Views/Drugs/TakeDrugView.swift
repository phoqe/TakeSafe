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
    
    @State var dosage: String = ""
    @State var showBioavailabilityAlert = false
    
    var body: some View {
        VStack {
            List {
                HStack {
                    TextField("Dosage", text: $dosage)
                        .keyboardType(.decimalPad)
                    Text(drug.massUnit.symbol)
                }
                
                HStack {
                    Text("Bioavailability")
                        .bold()
                    Spacer()
                    Text("\(Int(round(drug.bioavailability * 100)))%")
                    Button(action: {
                        showBioavailabilityAlert = true
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .alert(isPresented: $showBioavailabilityAlert) {
                        Alert(title: Text("Bioavailability"), message: Text("The proportion of a drug which enters the circulation when introduced into the body and so is able to have an active effect."), dismissButton: .default(Text("OK")))
                    }
                }
            }
        }
        .navigationBarTitle(Text("Take \(drug.name)"))
    }
}
