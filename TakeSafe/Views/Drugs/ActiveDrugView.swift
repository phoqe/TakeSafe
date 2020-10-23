//
//  ActiveDrugView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-18.
//

import SwiftUI

struct ActiveDrugView: View {
    var activeDrug: ActiveDrug
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showRemoveAlert = false
    
    var body: some View {
        Form {
            Button("remove") {
                showRemoveAlert = true
            }
            .foregroundColor(.red)
            .alert(isPresented: $showRemoveAlert) {
                Alert(title: Text("Remove active drug?"), message: Text("You will no longer be able to track this drug."), primaryButton: .destructive(Text("Remove")) {
                    DrugManager.removeActiveDrug(id: activeDrug.id)
                    presentationMode.wrappedValue.dismiss()
                }, secondaryButton: .cancel())
            }
        }
        .navigationBarTitle(activeDrug.name)
    }
}

struct ActiveDrugView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveDrugView(activeDrug: SampleData.activeDrug)
    }
}
