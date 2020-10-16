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
    @State var showTakeDrugView = false
    
    var body: some View {
        Form {
            Section() {
                Button(action: {
                    showLearnMore = true
                }, label: {
                    HStack {
                        Text(drug.description)
                            .padding(.trailing)
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
                    
                    Text(drug.drugClass.localizedName())
                    
                    Button(action: {
                        showDrugClassAlert = true
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .alert(isPresented: $showDrugClassAlert) {
                        Alert(title: Text(drug.drugClass.localizedName()), message: Text(drug.drugClass.localizedDescription()), dismissButton: .default(Text("ok".localized())))
                    }
                }
                .padding(.vertical, 7.5)
                
                HStack {
                    Text(NSLocalizedString("drugDependenceName", comment: ""))
                        .bold()
                    
                    Spacer()
                    
                    Text(drug.dependence.localizedString())
                    
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
                .padding(.vertical, 7.5)
                
                HStack {
                    Text(NSLocalizedString("drugAddictionName", comment: ""))
                        .bold()
                    
                    Spacer()
                    
                    Text(drug.addiction.localizedName())
                    
                    Button(action: {
                        showAddictionAlert = true
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .alert(isPresented: $showAddictionAlert) {
                        Alert(title: Text(NSLocalizedString("drugAddictionName", comment: "")), message: Text(NSLocalizedString("drugAddictionDescription", comment: "")), dismissButton: .default(Text("ok".localized())))
                    }
                }
                .padding(.vertical, 7.5)
                
                Timeline(onset: drug.onset, duration: drug.duration)
                    .padding(.vertical)
            }
            
            Section() {
                Button(String(format: NSLocalizedString("drugTakeDrug", comment: ""), drug.name)) {
                    showTakeDrugView = true
                }
            }
        }
        .navigationBarTitle(drug.name)
        .safariView(isPresented: $showLearnMore) {
            SafariView(url: drug.learnMoreUrl, configuration: SafariView.Configuration(
                entersReaderIfAvailable: true
            ))
        }
        .sheet(isPresented: $showTakeDrugView) {
            TakeDrugView(drug: drug, presented: $showTakeDrugView)
        }
    }
}
