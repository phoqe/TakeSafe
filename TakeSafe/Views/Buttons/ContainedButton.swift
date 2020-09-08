//
//  ContainedButton.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct ContainedButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
        })
        .background(Color("Primary Color"))
        .cornerRadius(5)
    }
}

struct ContainedButton_Previews: PreviewProvider {
    static var previews: some View {
        ContainedButton(title: "Get Started") {
            
        }
    }
}
