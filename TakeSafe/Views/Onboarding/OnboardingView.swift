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
        IntroPage(image: "Medicine", title: "Allow access to Apple Health.", description: "We can work with the Apple Health app to improve our predictions and gain more insight. Data such as body measurements, heart rate, and bed time may be used.")
    ]
    
    var body: some View {
        if state == .intro {
            IntroPageView(introPages)
        } else if state == .setup {
            SetupPageView(setupPages)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        OnboardingView().preferredColorScheme(.dark)
    }
}
