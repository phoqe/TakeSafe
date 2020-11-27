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
                let title = "Addiction Profile"
                let subtitle = "A brain disorder characterized by compulsive engagement."
                let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus commodo viverra maecenas accumsan lacus vel facilisis volutpat. Ut ornare lectus sit amet est placerat in egestas. Laoreet id donec ultrices tincidunt arcu non sodales neque sodales. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent. Duis at tellus at urna condimentum mattis. Viverra orci sagittis eu volutpat odio facilisis mauris. Fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis. Nisl purus in mollis nunc sed id semper risus in. Fusce id velit ut tortor pretium. Et ultrices neque ornare aenean. Aliquam sem fringilla ut morbi tincidunt augue interdum. Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis. Auctor urna nunc id cursus metus aliquam eleifend. Cum sociis natoque penatibus et magnis dis parturient montes nascetur. Vulputate eu scelerisque felis imperdiet."

                InfoSheet(image: "Doctors", title: title, subtitle: subtitle, text: text)
            }
        }
    }
}

struct DrugView_Previews: PreviewProvider {
    static var previews: some View {
        DrugView(drug: SampleData.drug)
    }
}
