//
//  SampleData.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-17.
//

import Foundation

struct SampleData {
    static let drug = Drug(id: "caffeine", name: "Caffeine", aliases: ["Guaranine", "Methyltheobromine", "1,3,7-Trimethylxanthine"], description: "Caffeine is a central nervous system stimulant of the methylxanthine class. It is the world’s most widely consumed psychoactive drug.", learnMoreUrl: URL(string: "https://en.wikipedia.org/wiki/Caffeine")!, icon: .energy, drugClass: .stimulant, dependence: .low, addiction: .low, onset: 1.0, duration: 4.0, massUnit: .milligrams, ld50: LD50(value: 192, unitDividend: .milligrams, unitDivisor: .kilograms), defaultDose: 100, doseStep: 50, commonDoses: [100, 200], administrationRoutes: [AdministrationRoute(id: "oral", bioavailability: 99), AdministrationRoute(id: "insufflation", bioavailability: 99), AdministrationRoute(id: "enema", bioavailability: 99), AdministrationRoute(id: "rectal", bioavailability: 99), AdministrationRoute(id: "intravenous", bioavailability: 100)])
    static let activeDrug = ActiveDrug(drug: drug, dose: 200, ingestion: Date().addingTimeInterval(TimeInterval(-6000)), administrationRoute: AdministrationRoute(id: "oral", bioavailability: 99))
}
