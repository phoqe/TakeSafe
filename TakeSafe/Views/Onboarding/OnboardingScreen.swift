//
//  OnboardingScreen.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct OnboardingScreen: View {
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

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(image: "Medical Care", title: "TakeSafe. Take drugs safely.", description: "Trouble sleeping? Feeling fatigued? Take control of your life by tracking the motion and effects of drugs like caffeine. All from your iPhone.")
        
        OnboardingScreen(image: "Medical Care", title: "TakeSafe. Take drugs safely.", description: "Trouble sleeping? Feeling fatigued? Take control of your life by tracking the motion and effects of drugs like caffeine. All from your iPhone.").preferredColorScheme(.dark)
    }
}
