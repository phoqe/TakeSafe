//
//  ContentView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct ContentView: View {
    @State var onboardingState: OnboardingState = .intro
    let hasOnboarded = UserDefaults.standard.bool(forKey: "hasOnboarded")
    
    var body: some View {
        if !hasOnboarded {
            OnboardingView(state: $onboardingState)
        }
    
        if hasOnboarded || onboardingState == .finished {
            DrugListView()
        }
    }
}
