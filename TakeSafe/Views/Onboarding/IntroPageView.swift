//
//  IntroPageView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct IntroPageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    @Binding var onboardingState: OnboardingState
    
    init(_ views: [Page], _ onboardingState: Binding<OnboardingState>) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._onboardingState = onboardingState
    }
    
    var body: some View {
        let showButton = currentPage == 3
        
        VStack {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            
            if showButton {
                ContainedButton(title: NSLocalizedString("introPageViewButton", comment: "")) {
                    onboardingState = .setup
                }
            } else {
                ContainedButton(title: NSLocalizedString("introPageViewButton", comment: "")) {
                    onboardingState = .setup
                }
                .hidden()
            }
            
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.vertical)
        }
    }
}

