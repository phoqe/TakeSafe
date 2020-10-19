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
    
    var body: some View {
        Form {
            Button("remove") {
                DrugManager.removeActiveDrug(id: activeDrug.id)
                presentationMode.wrappedValue.dismiss()
            }
            .foregroundColor(.red)
        }
        .navigationBarTitle(activeDrug.name)
    }
}

struct ActiveDrugView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveDrugView(activeDrug: SampleData.activeDrug)
    }
}
