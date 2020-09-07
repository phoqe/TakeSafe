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
        OnboardingPage(image: "Medical Care", title: NSLocalizedString("onboardingPage1Title", comment: ""), description: NSLocalizedString("onboardingPage1Description", comment: "")),
        
        OnboardingPage(image: "Time Management", title: NSLocalizedString("onboardingPage2Title", comment: ""), description: NSLocalizedString("onboardingPage2Description", comment: "")),
        
        OnboardingPage(image: "Doctors", title: NSLocalizedString("onboardingPage3Title", comment: ""), description: NSLocalizedString("onboardingPage3Description", comment: "")),
        
        OnboardingPage(image: "Profile Details", title: NSLocalizedString("onboardingPage4Title", comment: ""), description: NSLocalizedString("onboardingPage4Description", comment: ""))
    ]
    
    let setupPages = [
        OnboardingPage(image: "Medicine", title: NSLocalizedString("onboardingSetupPage1Title", comment: ""), description: NSLocalizedString("onboardingSetupPage1Description", comment: ""))
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
