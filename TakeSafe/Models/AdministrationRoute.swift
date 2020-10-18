//
//  AdministrationRoute.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-18.
//

import SwiftUI

struct AdministrationRoute {
    let name: String
    let bioavailability: Int
}

enum AdministrationRoute: String, Codable, CaseIterable, Equatable {
    case oral = "administrationRouteOral"
    case insufflation = "administrationRouteInsufflation"
    case enema = "administrationRouteEnema"
    case rectal = "administrationRouteRectal"
    case intravenous = "administrationRouteIntravenous"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let administrationRoute = try container.decode(String.self)
        
        switch administrationRoute {
            case "oral", "administrationRouteOral":
                self = .oral
            case "insufflation", "administrationRouteInsufflation":
                self = .insufflation
            case "enema", "administrationRouteEnema":
                self = .enema
            case "rectal", "administrationRouteRectal":
                self = .rectal
            case "intravenous", "administrationRouteIntravenous":
                self = .intravenous
            default:
                fatalError()
        }
    }
}
