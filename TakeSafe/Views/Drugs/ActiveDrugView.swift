//
//  ActiveDrugView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-18.
//

import SwiftUI

struct ActiveDrugView: View {
    var activeDrug: ActiveDrug

    @EnvironmentObject var activeDrugs: ActiveDrugs
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showRemoveAlert = false
    
    var body: some View {
        Form {
            if let duration = activeDrug.administrationRoute.duration {
                Section() {
                    Timeline(duration: duration)
                        .padding(.vertical, 10)
                }
            }
        }
        .navigationBarTitle(activeDrug.name)
    }
}
