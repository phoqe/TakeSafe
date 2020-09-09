//
//  OnboardingView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct OnboardingView: View {
    @State var state: OnboardingState = .setup
    
    let introPages = [
        IntroPage(image: "Medical Care", title: NSLocalizedString("introPage1Title", comment: ""), description: NSLocalizedString("introPage1Description", comment: "")),
        IntroPage(image: "Time Management", title: NSLocalizedString("introPage2Title", comment: ""), description: NSLocalizedString("introPage2Description", comment: "")),
        IntroPage(image: "Doctors", title: NSLocalizedString("introPage3Title", comment: ""), description: NSLocalizedString("introPage3Description", comment: "")),
        IntroPage(image: "Profile Details", title: NSLocalizedString("introPage4Title", comment: ""), description: NSLocalizedString("introPage4Description", comment: ""))
    ]
    
    let setupPages = [
        IntroPage(image: "Medicine", title: NSLocalizedString("onboardingSetupPage1Title", comment: ""), description: NSLocalizedString("onboardingSetupPage1Description", comment: "")),
        IntroPage(image: "Sleep Analysis", title: NSLocalizedString("onboardingSetupPage2Title", comment: ""), description: NSLocalizedString("onboardingSetupPage2Description", comment: "")),
        IntroPage(image: "Breakfast", title: NSLocalizedString("onboardingSetupPage3Title", comment: ""), description: NSLocalizedString("onboardingSetupPage3Description", comment: ""))
    ]
    
    var body: some View {
        if state == .intro {
            IntroPageView(introPages, $state)
        } else if state == .setup {
            SetupPageView(setupPages, $state)
        } else if state == .completed {
            IntroPage(image: "Finish Line", title: NSLocalizedString("onboardingCompletedTitle", comment: ""), description: NSLocalizedString("onboardingCompletedDescription", comment: ""))
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        OnboardingView().preferredColorScheme(.dark)
    }
}
