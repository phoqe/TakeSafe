//
//  WarningListItem.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-15.
//

import SwiftUI

struct WarningListItem: View {
    var title: String
    var message: String

    var body: some View {
        VStack(alignment: .leading) {
            Label(
                title: {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.orange)
                },
                icon: {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.orange)
                }
            )
            .padding(.bottom, 5)

            Text(message)
                .foregroundColor(.secondary)
        }
        .padding(.vertical)
    }
}

struct WarningListItem_Previews: PreviewProvider {
    static var previews: some View {
        WarningListItem(title: "May disturb your sleep", message: "May disturb your sleep")
    }
}
