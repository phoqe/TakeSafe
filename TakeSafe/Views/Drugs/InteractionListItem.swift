//
//  InteractionListItem.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-14.
//

import SwiftUI

struct InteractionListItem: View {
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
        DisclosureGroup(
            content: {
                Text(interaction.description)
            },
            label: {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(foregroundColor())
                        .padding(.trailing, 7.5)

                    VStack(alignment: .leading) {
                        Text(interaction.severity.localizedName)
                            .foregroundColor(foregroundColor())
                            .bold()
                            .padding(.bottom, -2.5)

                        Text(interaction.name)
                    }
                }
            }
        )
        .padding(.vertical)
    }
}

struct InteractionListItem_Previews: PreviewProvider {
    static var previews: some View {
        InteractionListItem(interaction: SampleData.minorInteraction)
    }
}
