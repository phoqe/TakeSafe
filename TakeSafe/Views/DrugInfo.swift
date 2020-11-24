//
//  DrugInfo.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-22.
//

import SwiftUI

struct DrugInfo: View {
    var drug: Drug

    func addictionForegroundColor() -> Color {
        switch drug.addiction {
            case .low:
                return .blue
            case .moderate:
                return .orange
            case .high:
                return .red
        }
    }

    func dependenceForegroundColor() -> Color {
        switch drug.dependence {
            case .low:
                return .blue
            case .moderate:
                return .orange
            case .high:
                return .red
        }
    }

    func legalityForegroundColor() -> Color {
        return .red
    }

    var body: some View {
        HStack {
            Image(systemName: "a.circle.fill")
                .foregroundColor(addictionForegroundColor())

            Image(systemName: "d.circle.fill")
                .foregroundColor(dependenceForegroundColor())

            Image(systemName: "l.circle.fill")
                .foregroundColor(legalityForegroundColor())
        }
    }
}

struct DrugInfo_Previews: PreviewProvider {
    static var previews: some View {
        DrugInfo(drug: SampleData.drug)
    }
}
