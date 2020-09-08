//
//  IntroPage.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct IntroPage: View {
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 275, height: 200)
            
            VStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom)
                
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

struct IntroPage_Previews: PreviewProvider {
    static var previews: some View {
        let image = "Profile Details"
        let title = "Ready to get started?"
        let description = "Because we are! We want to help you catch the day, perform at your best, and go to sleep unscathed. Let’s get to know each other!"
        
        IntroPage(image: image, title: title, description: description)
        IntroPage(image: image, title: title, description: description).preferredColorScheme(.dark)
    }
}
