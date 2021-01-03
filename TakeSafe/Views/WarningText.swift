//
//  WarningText.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2021-01-03.
//

import SwiftUI

struct WarningText: View {
    var content: String
    
    var body: some View {
        Text(content.localized())
            .listRowBackground(Color.orange)
            .padding(.vertical, 5)
    }
}

struct WarningText_Previews: PreviewProvider {
    static var previews: some View {
        WarningText(content: "Test")
    }
}
