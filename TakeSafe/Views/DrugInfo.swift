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
        HStack(spacing: 5) {
            Image(systemName: "a.circle.fill")
                .foregroundColor(drug.addictionForegroundColor())

            Image(systemName: "d.circle.fill")
                .foregroundColor(drug.dependenceForegroundColor())

            if drug.legality != nil {
                if let legality = drug.regionalizedLegality() {
                    HStack(spacing: 4) {
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundColor(.orange)

                        Text(legality.statuteShort)
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                    }
                } else {
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(.orange)
                }
            }
        }
    }
}

struct DrugInfo_Previews: PreviewProvider {
    static var previews: some View {
        DrugInfo(drug: SampleData.drug)
    }
}
