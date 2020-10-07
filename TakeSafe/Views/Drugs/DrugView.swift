//
//  DrugView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import SwiftUI
import BetterSafariView

struct DrugView: View {
    var drug: Drug
    
    @State var showLearnMore = false
    @State var showDrugClassAlert = false
    @State var showDependenceAlert = false
    @State var showAddictionAlert = false
    @State var showBioavailabilityAlert = false
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Button(action: {
                        showLearnMore = true
                    }, label: {
                        Text(drug.description)
                            .padding(.vertical, 8)
                    })
                }
                
                HStack {
                    Text("Drug class")
                        .bold()
                    Spacer()
                    Text(drug.drugClass.rawValue)
                    Button(action: {
                        showDrugClassAlert = true
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .alert(isPresented: $showDrugClassAlert) {
                        Alert(title: Text("Stimulant"), message: Text("A substance that raises levels of physiological or nervous activity in the body."), dismissButton: .default(Text("OK")))
                    }
                }
                
                HStack {
                    Text("Dependence")
                        .bold()
                    Spacer()
                    Text(drug.dependence.rawValue)
                    Button(action: {
                        showDependenceAlert = true
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .alert(isPresented: $showDependenceAlert) {
                        Alert(title: Text("Dependence"), message: Text("Dependence is an adaptive state that develops from repeated drug administration and results in withdrawal upon cessation of drug use."), dismissButton: .default(Text("OK")))
                    }
                }
                
                HStack {
                    Text("Addiction")
                        .bold()
                    Spacer()
                    Text(drug.addiction.rawValue)
                    Button(action: {
                        showAddictionAlert = true
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .alert(isPresented: $showAddictionAlert) {
                        Alert(title: Text("Addiction"), message: Text("Addiction is a brain disorder characterized by compulsive engagement in rewarding stimuli despite adverse consequences."), dismissButton: .default(Text("OK")))
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
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Timeline")
                            .bold()
                    }
                }
            }
            .navigationBarTitle(Text(drug.name))
            .safariView(isPresented: $showLearnMore) {
                SafariView(url: URL(string: drug.learnMoreUrl)!, configuration: SafariView.Configuration(
                    entersReaderIfAvailable: true
                ))
            }
        }
    }
}

struct DrugView_Previews: PreviewProvider {
    static var previews: some View {
        DrugView(drug: Drug(name: "Caffeine", aliases: ["Guaranine", "Methyltheobromine", "1,3,7-Trimethylxanthine", "Theine"], description: "Caffeine is a central nervous system (CNS) stimulant of the methylxanthine class. It is the world's most widely consumed psychoactive drug.", learnMoreUrl: "https://en.wikipedia.org/wiki/Caffeine", dependence: .low, addiction: .low, bioavailability: 99, drugClass: .stimulant, onset: DateComponents(hour: 1), duration: DateComponents(hour: 4)))
    }
}
