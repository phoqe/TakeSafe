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
    
    @State var dose: Int
    @State var showMedianLethalDoseAlert = false
    @State var showBioavailabilityAlert = false
    @Binding var presented: Bool
    
    init(drug: Drug, presented: Binding<Bool>) {
        self.drug = drug
        
        _presented = presented
        _dose = State(initialValue: drug.defaultDose)
    }
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Median lethal dose")
                        .bold()
                    
                    Spacer()
                    
                    Text("\(Int(round(drug.ld50.value))) \(drug.ld50.unit.symbol)/\(UnitMass.kilograms.symbol)")
                    
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
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Dose")
                            .bold()
                        
                        Stepper("\(dose) \(drug.massUnit.symbol)", value: $dose, in: 50...400, step: drug.doseStep)
                    }
                    
                    HStack {
                        Text("Common doses")
                            .bold()
                        
                        Spacer()
                        
                        ForEach(drug.commonDoses, id: \.self) { dose in
                            Button("\(dose)") {
                                self.dose = dose
                            }
                            .buttonStyle(PlainButtonStyle())
                            .foregroundColor(.accentColor)
                            .disabled(self.dose == dose)
                        }
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("In circulation")
                            .bold()
                        
                        Spacer()
                        
                        Text("\(Int(drug.bioavailability * Double(dose))) \(drug.massUnit.symbol)")
                    }
                    .padding(.top)
                }
                .padding(.vertical)
            }
            .navigationBarTitle(Text("Take \(drug.name)"), displayMode: .inline)
//            .navigationBarItems(leading: Button("Cancel") {
//                self.presented = false
//            })
            .navigationBarItems(leading: Button("Cancel") {
                presented = false
            }, trailing: Button("Take") {
                presented = false
            })
        }
    }
}
