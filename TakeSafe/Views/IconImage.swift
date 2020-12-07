//
//  IconImage.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-17.
//

import SwiftUI

struct IconImage: View {
    var icon: String
    
    var body: some View {
        Image(icon)
            .resizable()
            .frame(width: 40, height: 40)
    }
}

struct IconImage_Previews: PreviewProvider {
    static var previews: some View {
        IconImage(icon: "Energy")
    }
}
