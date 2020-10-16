//
//  ProfileView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-10.
//

import SwiftUI

struct ProfileView: View {
    @State var activeDrugs: [Drug] = []
    
    func getActiveDrugs() {
        if let activeDrugs = DrugManager.activeDrugs() {
            self.activeDrugs = activeDrugs
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if activeDrugs.isEmpty {
                    EmptyState(title: "No active drugs.", description: "Add a drug and it’ll appear here.")
                } else {
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(activeDrugs) { activeDrug in
                                DrugGroupBox(drug: activeDrug)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                }
            }
            .navigationBarTitle("profileTitle".localized(), displayMode: .inline)
        }
        .onAppear(perform: getActiveDrugs)
    }
}
