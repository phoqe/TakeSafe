//
//  Timeline.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-07.
//

import SwiftUI

struct Timeline: View {
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(.blue)
            Rectangle()
                .foregroundColor(.green)
        }
        .frame(height: 8)
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline()
    }
}
