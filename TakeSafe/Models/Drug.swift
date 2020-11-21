//
//  Drug.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-06.
//

import Foundation
import HealthKit

class Drug: Codable, Identifiable {
    let id: String
    let name: String
    let aliases: [String]?
    let description: String
    let learnMoreUrl: URL
    let icon: Icon
    let drugClass: DrugClass
    let dependence: Dependence
    let addiction: Addiction
    let onset: Double
    let duration: Double
    let massUnit: UnitMass
    let ld50: LD50
    let defaultDose: Int
    let doseStep: Int
    let commonDoses: [Int]
    let administrationRoutes: [AdministrationRoute]
    let rdi: Int?
    let interactions: [DrugInteraction]?
    let warnBeforeBedtime: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case aliases
        case description
        case learnMoreUrl = "learn_more_url"
        case icon
        case drugClass = "drug_class"
        case dependence
        case addiction
        case onset
        case duration
        case massUnit = "mass_unit"
        case ld50 = "ld_50"
        case defaultDose = "default_dose"
        case doseStep = "dose_step"
        case commonDoses = "common_doses"
        case dose
        case ingestion
        case administrationRoutes = "administration_routes"
        case administrationRoute = "administration_route"
        case rdi
        case interactions
        case warnBeforeBedtime = "warn_before_bedtime"
    }
    
    init(id: String, name: String, aliases: [String]?, description: String, learnMoreUrl: URL, icon: Icon, drugClass: DrugClass, dependence: Dependence, addiction: Addiction, onset: Double, duration: Double, massUnit: UnitMass, ld50: LD50, defaultDose: Int, doseStep: Int, commonDoses: [Int], administrationRoutes: [AdministrationRoute], rdi: Int?, interactions: [DrugInteraction]?, warnBeforeBedtime: Int?) {
        self.id = id
        self.name = name
        self.aliases = aliases
        self.description = description
        self.learnMoreUrl = learnMoreUrl
        self.icon = icon
        self.drugClass = drugClass
        self.dependence = dependence
        self.addiction = addiction
        self.onset = onset
        self.duration = duration
        self.massUnit = massUnit
        self.ld50 = ld50
        self.defaultDose = defaultDose
        self.doseStep = doseStep
        self.commonDoses = commonDoses
        self.administrationRoutes = administrationRoutes
        self.rdi = rdi
        self.interactions = interactions
        self.warnBeforeBedtime = warnBeforeBedtime
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        aliases = try container.decodeIfPresent([String].self, forKey: .aliases)
        description = try container.decode(String.self, forKey: .description)
        learnMoreUrl = try container.decode(URL.self, forKey: .learnMoreUrl)
        icon = try container.decode(Icon.self, forKey: .icon)
        drugClass = try container.decode(DrugClass.self, forKey: .drugClass)
        dependence = try container.decode(Dependence.self, forKey: .dependence)
        addiction = try container.decode(Addiction.self, forKey: .addiction)
        onset = try container.decode(Double.self, forKey: .onset)
        duration = try container.decode(Double.self, forKey: .duration)
        massUnit = try container.decode(String.self, forKey: .massUnit).unitMass()!
        ld50 = try container.decode(LD50.self, forKey: .ld50)
        defaultDose = try container.decode(Int.self, forKey: .defaultDose)
        doseStep = try container.decode(Int.self, forKey: .doseStep)
        commonDoses = try container.decode([Int].self, forKey: .commonDoses)
        administrationRoutes = try container.decode([AdministrationRoute].self, forKey: .administrationRoutes)
        rdi = try container.decodeIfPresent(Int.self, forKey: .rdi)
        interactions = try container.decodeIfPresent([DrugInteraction].self, forKey: .interactions)
        warnBeforeBedtime = try container.decodeIfPresent(Int.self, forKey: .warnBeforeBedtime)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(aliases, forKey: .aliases)
        try container.encode(description, forKey: .description)
        try container.encode(learnMoreUrl, forKey: .learnMoreUrl)
        try container.encode(icon, forKey: .icon)
        try container.encode(drugClass, forKey: .drugClass)
        try container.encode(dependence, forKey: .dependence)
        try container.encode(addiction, forKey: .addiction)
        try container.encode(onset, forKey: .onset)
        try container.encode(duration, forKey: .duration)
        try container.encode(massUnit.string(), forKey: .massUnit)
        try container.encode(ld50, forKey: .ld50)
        try container.encode(defaultDose, forKey: .defaultDose)
        try container.encode(doseStep, forKey: .doseStep)
        try container.encode(commonDoses, forKey: .commonDoses)
        try container.encode(administrationRoutes, forKey: .administrationRoutes)
        try container.encodeIfPresent(rdi, forKey: .rdi)
        try container.encodeIfPresent(interactions, forKey: .interactions)
        try container.encodeIfPresent(warnBeforeBedtime, forKey: .warnBeforeBedtime)
    }

    func mayDisturbSleep() -> Bool {
        guard let warnBeforeBedtime = warnBeforeBedtime else {
            return false
        }

        var date1 = Date(timeIntervalSinceReferenceDate: 0)
        var date2 = Date(timeIntervalSinceReferenceDate: 0)
        let bedtime = Settings().bedtime
        let now = Date()
        let calendar = Calendar.current
        let dateComponents1 = calendar.dateComponents([.hour, .minute], from: bedtime)
        let dateComponents2 = calendar.dateComponents([.hour, .minute], from: now)

        date1 = calendar.date(byAdding: dateComponents1, to: date1)!
        date2 = calendar.date(byAdding: dateComponents2, to: date2)!

        let difference = calendar.dateComponents([.hour], from: date1, to: date2).hour!
        
        if difference >= warnBeforeBedtime {
            return true
        }

        return false
    }

    func personalizedLd50(completion: @escaping (_ ld50: Double?) -> Void) {
        guard let healthStore = HealthManager.shared.healthStore,
              let sampleType = HKQuantityType.quantityType(forIdentifier: .bodyMass) else {
            completion(nil)

            return
        }

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, results, error) in
            guard let samples = results as? [HKQuantitySample], let sample = samples.first else {
                completion(nil)

                return
            }

            let bodyMass = sample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
            let ld50 = bodyMass * self.ld50.value

            completion(ld50)
        }

        healthStore.execute(query)
    }
}
