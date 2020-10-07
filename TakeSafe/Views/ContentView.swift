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
            DrugView(drug: Drug(name: "Caffeine", aliases: ["Guaranine", "Methyltheobromine", "1,3,7-Trimethylxanthine", "Theine"], description: "Caffeine is a central nervous system stimulant of the methylxanthine class. It is the world’s most widely consumed psychoactive drug.", learnMoreUrl: "https://en.wikipedia.org/wiki/Caffeine", dependence: .low, addiction: .low, bioavailability: 99, drugClass: .stimulant, onset: DateComponents(hour: 1), duration: DateComponents(hour: 4), massUnit: UnitMass.milligrams))
        }
    }
}
