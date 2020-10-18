//
//  ActiveDrugView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-18.
//

import SwiftUI

struct ActiveDrugView: View {
    var activeDrug: ActiveDrug
    
    var body: some View {
        Form {
            Timeline(onset: activeDrug.onset, duration: activeDrug.duration)
                .padding(.vertical)
        }
        .navigationBarTitle(activeDrug.name)
    }
}

struct ActiveDrugView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveDrugView(activeDrug: SampleData.activeDrug)
    }
}
