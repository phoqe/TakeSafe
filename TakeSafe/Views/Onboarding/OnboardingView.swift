//
//  OnboardingView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ScrollView {
            OnboardingScreen(image: "Medical Care", title: "TakeSafe. Take drugs safely.", description: "Trouble sleeping? Feeling fatigued? Take control of your life by tracking the motion and effects of drugs like caffeine. All from your iPhone.")

            OnboardingScreen(image: "Time Management", title: "From absorption to excretion.", description: "Follow the time course of a drug’s absorption, bioavailability, distribution, metabolism, and excretion. Educated guesses based on numerous factors.")

            OnboardingScreen(image: "Doctors", title: "Realtime advice from experts.", description: "Another cup of coffee? We’ll tell you how it will impact the rest of your day and health and if it’ll disturb your sleep. Because sleep is important.")
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        OnboardingView().preferredColorScheme(.dark)
    }
}
