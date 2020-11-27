//
//  DrugView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import SwiftUI
import BetterSafariView

enum ActiveSheet: Identifiable {
    case administer
    case addiction

    var id: Int {
        hashValue
    }
}

struct DrugView: View {
    var drug: Drug
    
    @State var showLearnMore = false
    @State var showDependenceAlert = false
    @State var activeSheet: ActiveSheet?
    
    var body: some View {
        List {
            Section() {
                if drug.legality != nil {
                    Text("This drug may be illegal in your jurisdiction.")
                        .listRowBackground(Color.orange)
                }

                Button(action: {
                    showLearnMore = true
                }, label: {
                    HStack {
                        Text(drug.description)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                })
                .padding(.vertical)
                .foregroundColor(.primary)
                
                HStack {
                    Text(NSLocalizedString("drugDrugClass", comment: ""))
                        .bold()
                    
                    Spacer()
                    
                    Text(drug.drugClass.localizedName)
                }

                HStack {
                    Text(NSLocalizedString("drugAddictionName", comment: ""))
                        .bold()

                    Spacer()

                    Text(drug.addiction.localizedName)

                    Button(action: {
                        activeSheet = .addiction
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                }
                
                HStack {
                    Text(NSLocalizedString("drugDependenceName", comment: ""))
                        .bold()
                    
                    Spacer()
                    
                    Text(drug.dependence.localizedName)
                    
                    Button(action: {
                        showDependenceAlert = true
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .alert(isPresented: $showDependenceAlert) {
                        Alert(title: Text(NSLocalizedString("drugDependenceName", comment: "")), message: Text(NSLocalizedString("drugDependenceDescription", comment: "")), dismissButton: .default(Text("ok".localized())))
                    }
                }

                if let legality = drug.regionalizedLegality() {
                    HStack {
                        Text("Legality")
                            .bold()

                        Spacer()

                        Text(legality.statute)
                    }
                }
                
                Timeline(onset: drug.onset, duration: drug.duration)
                    .padding(.vertical)
            }

            if let interactions = drug.interactions {
                Section() {
                    NavigationLink(destination: InteractionList(interactions: interactions)) {
                        Text("Interactions")
                    }
                }
            }
            
            Section() {
                Button(String(format: NSLocalizedString("Administer", comment: ""), drug.name)) {
                    activeSheet = .administer
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle(drug.name)
        .safariView(isPresented: $showLearnMore) {
            SafariView(url: drug.learnMoreUrl, configuration: SafariView.Configuration(
                entersReaderIfAvailable: true
            ))
        }
        .sheet(item: $activeSheet) { _ in
            if activeSheet == .administer {
                TakeDrugView(drug: drug, activeSheet: $activeSheet)
            }

            if activeSheet == .addiction {
                let title = "Addiction Profile".localized()
                let text = drug.addictionProfile

                InfoSheet(image: "Doctors", title: title, text: text)
            }
        }
    }
}

struct DrugView_Previews: PreviewProvider {
    static var previews: some View {
        DrugView(drug: SampleData.drug)
    }
}
