//
//  ContentView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import SwiftUI

struct ContentView: View {
    @State var onboardingState: OnboardingState = .intro
    
    let onboarded = UserDefaults.standard.bool(forKey: "onboarded")
    
    var body: some View {
        if onboarded || onboardingState == .finished {
            TabView {
                DrugsView()
                    .tabItem {
                        Image(systemName: "pills.fill")
                        Text(NSLocalizedString("drugsTitle", comment: ""))
                    }
                
                ActivityView()
                    .tabItem {
                        Image(systemName: "bolt.fill")
                        Text(NSLocalizedString("profileTitle", comment: ""))
                    }
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text(NSLocalizedString("settingsTitle", comment: ""))
                    }
            }
        } else {
            OnboardingView(state: $onboardingState)
        }
    }
}
