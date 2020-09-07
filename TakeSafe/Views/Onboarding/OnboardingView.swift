//
//  OnboardingView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        OnboardingScreen(image: "Medical Care", title: "TakeSafe. Take drugs safely.", description: "Track the drugs you take. Make sure they don’t interfere with your life. All from your phone.")
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
