//
//  SampleData.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-17.
//

import Foundation

struct SampleData {
    static let drug = Drug(id: "caffeine", name: "Caffeine", aliases: ["Guaranine", "Methyltheobromine", "1,3,7-Trimethylxanthine"], description: "Caffeine is a central nervous system stimulant of the methylxanthine class. It is the world’s most widely consumed psychoactive drug.", learnMoreUrl: URL(string: "https://en.wikipedia.org/wiki/Caffeine")!, icon: .energy, drugClass: .stimulant, dependence: .low, addiction: .low, onset: 1.0, duration: 4.0, massUnit: .milligrams, ld50: LD50(value: 192, unitDividend: .milligrams, unitDivisor: .kilograms), defaultDose: 100, doseStep: 50, commonDoses: [100, 200], administrationRoutes: [AdministrationRoute(id: "oral", bioavailability: 99), AdministrationRoute(id: "insufflation", bioavailability: 99), AdministrationRoute(id: "enema", bioavailability: 99), AdministrationRoute(id: "rectal", bioavailability: 99), AdministrationRoute(id: "intravenous", bioavailability: 100)], rdi: 400, interactions: nil, warnBeforeBedtime: 6, legal: true, legality: nil)
    static let activeDrug = ActiveDrug(drug: drug, dose: 200, ingestion: Date().addingTimeInterval(TimeInterval(-6000)), administrationRoute: AdministrationRoute(id: "oral", bioavailability: 99))

    static let majorInteraction = DrugInteraction(id: "ephedrine", name: "Ephedrine", severity: .major, description: "Stimulant drugs speed up the nervous system. Caffeine and ephedrine are both stimulant drugs. Taking caffeine along with ephedrine might cause too much stimulation and sometimes severe side-effects and heart problems. Do not take caffeine and ephedrine at the same time.")

    static let moderateInteraction = DrugInteraction(id: "adenosine", name: "Adenosine", severity: .moderate, description: "Caffeine might block the effects of adenosine. Adenosine is often used by doctors to perform a test on the heart. This test is called a cardiac stress test. Stop consuming caffeine at least 24 hours before a cardiac stress test.")

    static let minorInteraction = DrugInteraction(id: "alcohol", name: "Alcohol", severity: .minor, description: "The body breaks down caffeine to get rid of it. Alcohol can decrease how quickly the body breaks down caffeine. Taking caffeine and alcohol might cause too much caffeine in the bloodstream and caffeine side-effects, including jitteriness, headache, and a fast heartbeat.")
}
