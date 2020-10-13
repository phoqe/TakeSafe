//
//  EmptyState.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-13.
//

import SwiftUI

struct EmptyState: View {
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 200, height: 125)
                .padding(.bottom)
            
            VStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom, -2.5)
                
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(image: "Server Down", title: "Couldn’t fetch drug list.", description: "Something went wrong when retrieving the drug list. Try again later.")
    }
}
