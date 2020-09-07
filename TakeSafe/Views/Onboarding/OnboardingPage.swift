//
//  OnboardingScreen.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct OnboardingPage: View {
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
        .padding(.vertical)
    }
}

struct OnboardingPage_Previews: PreviewProvider {
    static var previews: some View {
        let image = "Profile Details"
        let title = "Ready to get started?"
        let description = "Because we are! We want to help you catch the day, perform at your best, and go to sleep unscathed. Let’s get to know each other!"
        
        OnboardingPage(image: image, title: title, description: description)
        OnboardingPage(image: image, title: title, description: description).preferredColorScheme(.dark)
    }
}
