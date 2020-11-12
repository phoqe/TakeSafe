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
            Button("remove") {
                showRemoveAlert = true
            }
            .foregroundColor(.red)
            .alert(isPresented: $showRemoveAlert) {
                Alert(title: Text(String(format: "Remove active drug?".localized(), activeDrug.name)), message: Text("You will no longer be able to track this drug."), primaryButton: .destructive(Text("Remove")) {
                    DrugManager.removeActiveDrug(activeDrug: activeDrug)
                    presentationMode.wrappedValue.dismiss()
                    activeDrugs.items = activeDrugs.items.filter { $0.id != activeDrug.id }
                }, secondaryButton: .cancel())
            }
        }
        .navigationBarTitle(activeDrug.name)
    }
}
