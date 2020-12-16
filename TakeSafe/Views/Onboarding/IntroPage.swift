//
//  IntroPage.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct IntroPage: View {
    var image: (String, CGFloat, CGFloat)
    var title: String
    var description: String
    
    var body: some View {
        VStack(spacing: 30) {
            Image(image.0)
                .resizable()
                .frame(width: image.1, height: image.2)
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(description)
                    .foregroundColor(.secondary)
                    .lineSpacing(5)
            }
            .padding(.horizontal, 30)
        }
    }
}

struct IntroPage_Previews: PreviewProvider {
    static var previews: some View {
        let image = "Profile Details"
        let title = "Ready to get started?"
        let description = "Because we are! We want to help you catch the day, perform at your best, and go to sleep unscathed. Let’s get to know each other!"
        
        IntroPage(image: (image, 275, 200), title: title, description: description)
        IntroPage(image: (image, 275, 200), title: title, description: description).preferredColorScheme(.dark)
    }
}
