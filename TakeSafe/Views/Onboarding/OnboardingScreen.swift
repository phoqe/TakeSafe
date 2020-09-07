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
                .frame(width: 300, height: 200)
            
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
            .padding()
        }
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(image: "Medical Care", title: "TakeSafe. Take drugs safely.", description: "Track the drugs you take. Make sure they don’t interfere with your life. All from your phone.")
        
        OnboardingScreen(image: "Medical Care", title: "TakeSafe. Take drugs safely.", description: "Track the drugs you take. Make sure they don’t interfere with your life. All from your phone.").preferredColorScheme(.dark)
    }
}
