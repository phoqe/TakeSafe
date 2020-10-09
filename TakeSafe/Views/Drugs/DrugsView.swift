//
//  DrugsView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-08.
//

import SwiftUI

struct DrugsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: DrugView(drug: Drug(id: "caffeine", name: "Caffeine", aliases: ["Guaranine", "Methyltheobromine", "1,3,7-Trimethylxanthine", "Theine"], description: "Caffeine is a central nervous system stimulant of the methylxanthine class. It is the world’s most widely consumed psychoactive drug.", learnMoreUrl: "https://en.wikipedia.org/wiki/Caffeine", dependence: .low, addiction: .low, bioavailability: 0.99, drugClass: .stimulant, onset: DateComponents(hour: 1), duration: DateComponents(hour: 4), massUnit: UnitMass.milligrams, ld50: Measurement(value: 192, unit: UnitMass.milligrams), defaultDose: 100, doseStep: 50, commonDoses: [100, 200]))) {
                    Text("Caffeine")
                }
            }
            .navigationBarTitle(Text("Drugs"))
        }
    }
}

struct DrugsView_Previews: PreviewProvider {
    static var previews: some View {
        DrugsView()
    }
}