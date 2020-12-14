//
//  EmptyState.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-13.
//

import SwiftUI

struct EmptyState: View {
    var imageName: String?
    var title: String?
    var description: String?
    
    var body: some View {
        VStack(alignment: .center) {
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.bottom)
            }
            
            if title != nil || description != nil {
                VStack {
                    if let title = title {
                        Text(title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding(.bottom, -2.5)
                    }
                    
                    if let description = description {
                        Text(description)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            }
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState(title: "Couldn’t fetch drug list.", description: "Something went wrong when retrieving the drug list. Try again later.")
        EmptyState(imageName: "No Data", title: "Couldn’t fetch drug list.", description: "Something went wrong when retrieving the drug list. Try again later.")
    }
}
