//
//  OnboardingView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        OnboardingPageView([
            OnboardingPage(image: "Medical Care", title: NSLocalizedString("onboardingScreen1Title", comment: ""), description: NSLocalizedString("onboardingScreen1Description", comment: "")),
            
            OnboardingPage(image: "Time Management", title: NSLocalizedString("onboardingScreen2Title", comment: ""), description: NSLocalizedString("onboardingScreen2Description", comment: "")),
            
            OnboardingPage(image: "Doctors", title: NSLocalizedString("onboardingScreen3Title", comment: ""), description: NSLocalizedString("onboardingScreen3Description", comment: "")),
            
            OnboardingPage(image: "Profile Details", title: NSLocalizedString("onboardingScreen4Title", comment: ""), description: NSLocalizedString("onboardingScreen4Description", comment: ""))
        ])
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        OnboardingView().preferredColorScheme(.dark)
    }
}
