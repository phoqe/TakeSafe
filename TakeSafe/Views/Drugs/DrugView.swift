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
    @State var addictionSheetPresented = false
    @State var administerSheetPresented = false
    
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
                        addictionSheetPresented = true
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .sheet(isPresented: $addictionSheetPresented) {
                        if let languageCode = Locale.current.languageCode, languageCode == "sv" {
                            InfoSheet(image: "Doctors", title: String(format: "Addiction Profile".localized(), drug.sentenceName), text: drug.addictionProfile)
                        } else {
                            InfoSheet(image: "Doctors", title: String(format: "Addiction Profile".localized(), drug.name), text: drug.addictionProfile)
                        }
                    }
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
                    administerSheetPresented = true
                }
                .sheet(isPresented: $administerSheetPresented) {
                    TakeDrugView(drug: drug, presented: $administerSheetPresented)
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
    }
}

struct DrugView_Previews: PreviewProvider {
    static var previews: some View {
        DrugView(drug: SampleData.drug)
    }
}
