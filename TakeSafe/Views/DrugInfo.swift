//
//  DrugInfo.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-22.
//

import SwiftUI

struct DrugInfo: View {
    var drug: Drug

    var body: some View {
        HStack(spacing: 2.5) {
            Image(systemName: "a.circle.fill")
                .foregroundColor(drug.addictionForegroundColor())

            Image(systemName: "d.circle.fill")
                .foregroundColor(drug.dependenceForegroundColor())
        }
    }
}

struct DrugInfo_Previews: PreviewProvider {
    static var previews: some View {
        DrugInfo(drug: SampleData.drug)
    }
}
