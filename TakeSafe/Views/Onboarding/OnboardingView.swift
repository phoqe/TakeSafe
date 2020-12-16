//
//  OnboardingView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var state: OnboardingState
    
    let introPages = [
        IntroPage(image: ("Medical Care", 275, 200), title: NSLocalizedString("introPage1Title", comment: ""), description: NSLocalizedString("introPage1Description", comment: "")),
        IntroPage(image: ("Time Management", 275, 200), title: NSLocalizedString("introPage2Title", comment: ""), description: NSLocalizedString("introPage2Description", comment: "")),
        IntroPage(image: ("Doctors", 250, 200), title: NSLocalizedString("introPage3Title", comment: ""), description: NSLocalizedString("introPage3Description", comment: "")),
        IntroPage(image: ("Profile Details", 275, 200), title: NSLocalizedString("introPage4Title", comment: ""), description: NSLocalizedString("introPage4Description", comment: ""))
    ]
    
    let setupPages = [
        IntroPage(image: ("Medicine", 275, 200), title: NSLocalizedString("onboardingSetupPage1Title", comment: ""), description: NSLocalizedString("onboardingSetupPage1Description", comment: "")),
        IntroPage(image: ("Sleep Analysis", 275, 200), title: NSLocalizedString("onboardingSetupPage2Title", comment: ""), description: NSLocalizedString("onboardingSetupPage2Description", comment: "")),
        IntroPage(image: ("Breakfast", 275, 200), title: NSLocalizedString("onboardingSetupPage3Title", comment: ""), description: NSLocalizedString("onboardingSetupPage3Description", comment: "")),
        IntroPage(image: ("Finish Line", 275, 200), title: NSLocalizedString("onboardingSetupPage4Title", comment: ""), description: NSLocalizedString("onboardingSetupPage4Description", comment: ""))
    ]
    
    var body: some View {
        if state == .intro {
            IntroPageView(introPages, $state)
        } else if state == .setup {
            SetupPageView(setupPages, $state)
        }
    }
}
