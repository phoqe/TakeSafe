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
    
    func takeDrug() {
        presented = false
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    HStack {
                        Text(NSLocalizedString("takeDrugBioavailabilityName", comment: ""))
                            .bold()
                        
                        Spacer()
                        
                        Text("\(drug.bioavailability)%")
                        
                        Button(action: {
                            showBioavailabilityAlert = true
                        }, label: {
                            Image(systemName: "info.circle")
                        })
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.accentColor)
                        .alert(isPresented: $showBioavailabilityAlert) {
                            Alert(title: Text(NSLocalizedString("takeDrugBioavailabilityName", comment: "")), message: Text(NSLocalizedString("takeDrugBioavailabilityDescription", comment: "")), dismissButton: .default(Text("ok".localized())))
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(NSLocalizedString("takeDrugDose", comment: ""))
                                .bold()
                            
                            Stepper("\(dose) \(drug.massUnit.symbol)", value: $dose, in: drug.doseStep...Int.max, step: drug.doseStep)
                        }
                        
                        HStack {
                            Text(NSLocalizedString("takeDrugCommonDoses", comment: ""))
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
                            Text(NSLocalizedString("takeDrugInCirculation", comment: ""))
                                .bold()
                            
                            Spacer()
                            
                            Text("\(drug.bioavailability * dose / 100) \(drug.massUnit.symbol)")
                        }
                        .padding(.top)
                        
                        HStack {
                            Text(NSLocalizedString("takeDrugMedianLethalDoseName", comment: ""))
                                .bold()
                            
                            Spacer()
                            
                            Text("\(drug.ld50.value) \(drug.ld50.unitDividend.symbol)/\(drug.ld50.unitDivisor.symbol)")
                            
                            Button(action: {
                                showMedianLethalDoseAlert = true
                            }, label: {
                                Image(systemName: "info.circle")
                            })
                            .buttonStyle(PlainButtonStyle())
                            .foregroundColor(.accentColor)
                            .alert(isPresented: $showMedianLethalDoseAlert) {
                                Alert(title: Text(NSLocalizedString("takeDrugMedianLethalDoseName", comment: "")), message: Text(NSLocalizedString("takeDrugMedianLethalDoseDescription", comment: "")), dismissButton: .default(Text("ok".localized())))
                            }
                        }
                        .padding(.top)
                    }
                    .padding(.vertical)
                }

                Section() {
                    Button(action: takeDrug) {
                        Text(String(format: NSLocalizedString("takeDrugTake", comment: ""), dose, drug.massUnit.symbol))
                    }
                }
            }
            .navigationBarTitle(String(format: NSLocalizedString("drugTakeDrug", comment: ""), drug.name), displayMode: .inline)
            .navigationBarItems(leading: Button(NSLocalizedString("takeDrugCancel", comment: "")) {
                presented = false
            })
        }
    }
}
