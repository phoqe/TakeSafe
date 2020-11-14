//
//  InteractionGroupBox.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-14.
//

import SwiftUI

struct InteractionGroupBox: View {
    var interaction: DrugInteraction

    func foregroundColor() -> Color {
        switch interaction.severity {
            case .minor:
                return .blue
            case .moderate:
                return .orange
            case .major:
                return .red
        }
    }

    var body: some View {
        GroupBox(label: Label(interaction.severity.localizedName, systemImage: "exclamationmark.triangle.fill").foregroundColor(foregroundColor())) {
            Text(interaction.description)
                .padding(.vertical, 5)
        }
    }
}

struct InteractionGroupBox_Previews: PreviewProvider {
    static var previews: some View {
        InteractionGroupBox(interaction: SampleData.minorInteraction)
        InteractionGroupBox(interaction: SampleData.moderateInteraction)
            .preferredColorScheme(.dark)
        InteractionGroupBox(interaction: SampleData.majorInteraction)
    }
}
