//
//  ActiveDrug.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-17.
//

import Foundation

class ActiveDrug: Drug {
    let dose: Int
    let ingestion: Date
    let administrationRoute: AdministrationRoute
    
    init(drug: Drug, dose: Int, ingestion: Date, administrationRoute: AdministrationRoute) {
        self.dose = dose
        self.ingestion = ingestion
        self.administrationRoute = administrationRoute
        
        super.init(id: UUID().uuidString, name: drug.name, aliases: drug.aliases, description: drug.description, learnMoreUrl: drug.learnMoreUrl, icon: drug.icon, drugClass: drug.drugClass, dependence: drug.dependence, addiction: drug.addiction, onset: drug.onset, duration: drug.duration, massUnit: drug.massUnit, ld50: drug.ld50, defaultDose: drug.defaultDose, doseStep: drug.doseStep, commonDoses: drug.commonDoses, administrationRoutes: drug.administrationRoutes)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        dose = try container.decode(Int.self, forKey: .dose)
        ingestion = try container.decode(Date.self, forKey: .ingestion)
        administrationRoute = try container.decode(AdministrationRoute.self, forKey: .administrationRoute)
        
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(dose, forKey: .dose)
        try container.encode(ingestion, forKey: .ingestion)
        try container.encode(administrationRoute, forKey: .administrationRoute)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(aliases, forKey: .aliases)
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
    }
}
