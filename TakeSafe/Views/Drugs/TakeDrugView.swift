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
        if let data = UserDefaults.standard.data(forKey: "activeDrugs") {
            
            // There are already active drugs, let’s add another one, why not?
            
            let decoder = JSONDecoder()
            
            if var activeDrugs = try? decoder.decode([Drug].self, from: data) {
                activeDrugs.append(drug)
                
                let encoder = JSONEncoder()
                
                if let data = try? encoder.encode(activeDrugs) {
                    UserDefaults.standard.set(data, forKey: "activeDrugs")
                    
                    presented = false
                }
            }
            
            return
        }
        
        // There are no active drugs, let’s create it.
        
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode([drug]) {
            UserDefaults.standard.set(data, forKey: "activeDrugs")
        }
        
        presented = false
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    HStack {
                        Text("Median lethal dose")
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
                            Alert(title: Text("Median lethal dose"), message: Text("The median lethal dose for a substance is the dose required to kill half the members of a tested population after a specified test duration."), dismissButton: .default(Text("OK")))
                        }
                    }
                    
                    HStack {
                        Text("Bioavailability")
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
                            Alert(title: Text("Bioavailability"), message: Text("The proportion of a drug which enters the circulation when introduced into the body and so is able to have an active effect."), dismissButton: .default(Text("OK")))
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Dose")
                                .bold()
                            
                            Stepper("\(dose) \(drug.massUnit.symbol)", value: $dose, in: drug.doseStep...1000, step: drug.doseStep)
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
                            
                            Text("\(drug.bioavailability * dose / 100)")
                        }
                        .padding(.top)
                    }
                    .padding(.vertical)
                }

                Section() {
                    Button(action: takeDrug) {
                        Text("Take \(dose) \(drug.massUnit.symbol)")
                    }
                }
            }
            .navigationBarTitle("Take \(drug.name)", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presented = false
            })
        }
    }
}
