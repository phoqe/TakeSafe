//
//  OnboardingView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct OnboardingView: View {
    @State var state: OnboardingState = .intro
    
    let introPages = [
        OnboardingPage(image: "Medical Care", title: NSLocalizedString("onboardingScreen1Title", comment: ""), description: NSLocalizedString("onboardingScreen1Description", comment: "")),
        
        OnboardingPage(image: "Time Management", title: NSLocalizedString("onboardingScreen2Title", comment: ""), description: NSLocalizedString("onboardingScreen2Description", comment: "")),
        
        OnboardingPage(image: "Doctors", title: NSLocalizedString("onboardingScreen3Title", comment: ""), description: NSLocalizedString("onboardingScreen3Description", comment: "")),
        
        OnboardingPage(image: "Profile Details", title: NSLocalizedString("onboardingScreen4Title", comment: ""), description: NSLocalizedString("onboardingScreen4Description", comment: ""))
    ]
    
    let setupPages = [
        OnboardingPage(image: "Profile Details", title: NSLocalizedString("onboardingScreen4Title", comment: ""), description: NSLocalizedString("onboardingScreen4Description", comment: ""))
    ]
    
    var body: some View {
        if state == .intro {
            OnboardingPageView(introPages)
        } else if state == .setup {
            OnboardingPageView(setupPages)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        OnboardingView().preferredColorScheme(.dark)
    }
}
