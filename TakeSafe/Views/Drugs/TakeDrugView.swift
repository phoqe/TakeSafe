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
    
    @State var administrationRoute: AdministrationRoute
    @State var dose: Int = 0
    @State var showMedianLethalDoseAlert = false
    @State var showBioavailabilityAlert = false
    @Binding var presented: Bool
    
    init(drug: Drug, presented: Binding<Bool>) {
        self.drug = drug
        
        _presented = presented
        _administrationRoute = State(initialValue: drug.administrationRoutes[0])
    }
    
    func takeDrug() {
        let activeDrug = ActiveDrug(drug: drug, dose: dose, ingestion: Date(), administrationRoute: administrationRoute)
        
        DrugManager.addActiveDrug(activeDrug: activeDrug)
        
        presented = false
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    HStack {
                        Text("takeDrugMedianLethalDoseName")
                        
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
                }
                
                Section(header: Text("takeDrugDosage"), footer: Text(dose == 0 ? "" : String(format: "takeDrugDosageFooter".localized(), administrationRoute.bioavailability * dose / 100, drug.massUnit.symbol, drug.name.lowercased(), administrationRoute.bioavailability))) {
                    Picker(selection: $administrationRoute, label: Text("takeDrugRouteOfAdministration")) {
                        ForEach(drug.administrationRoutes) { administrationRoute in
                            Text(administrationRoute.localizedName)
                                .tag(administrationRoute)
                        }
                    }
                    
                    Stepper("\(dose) \(drug.massUnit.symbol)", value: $dose, in: 0...Int.max, step: drug.doseStep)
                }

                if dose != 0 {
                    Section() {
                        Button(action: takeDrug) {
                            Text(String(format: NSLocalizedString("takeDrugTake", comment: ""), dose, drug.massUnit.symbol))
                        }
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

struct TakeDrugView_Previews: PreviewProvider {
    static var previews: some View {
        TakeDrugView(drug: SampleData.drug, presented: .constant(true))
    }
}
