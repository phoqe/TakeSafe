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
        VStack {

        }
        .navigationBarTitle(activeDrug.name)
    }
}
