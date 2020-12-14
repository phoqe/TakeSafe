//
//  ActivityView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-10.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var activeDrugs = ActiveDrugs(items: [])
    
    var body: some View {
        NavigationView {
            Group {
                if activeDrugs.items.isEmpty {
                    EmptyState(imageName: "No Data", title: "profileEmptyTitle".localized(), description: "profileEmptyDescription".localized())
                } else {
                    ActiveDrugList(activeDrugs: activeDrugs)
                }
            }
            .navigationBarTitle("profileTitle".localized(), displayMode: .inline)
        }
        .onAppear(perform: {
            activeDrugs.get()
        })
    }
}
