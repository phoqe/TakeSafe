//
//  ProfileView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-10.
//

import SwiftUI

struct ProfileView: View {
    @State var activeDrugs: [ActiveDrug] = []
    
    func getActiveDrugs() {
        if let activeDrugs = DrugManager.activeDrugs() {
            self.activeDrugs = activeDrugs
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if activeDrugs.isEmpty {
                    EmptyState(title: "profileEmptyTitle".localized(), description: "profileEmptyDescription".localized())
                } else {
                    Form {
                        List(activeDrugs) { activeDrug in
                            HStack {
                                Text(activeDrug.name)
                                    .bold()
                                
                                Spacer()
                                
                                Text("\(activeDrug.dose) \(activeDrug.massUnit.symbol)")
                                    .bold()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("profileTitle".localized(), displayMode: .inline)
        }
        .onAppear(perform: getActiveDrugs)
    }
}
