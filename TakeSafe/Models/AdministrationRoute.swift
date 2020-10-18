//
//  AdministrationRoute.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-18.
//

import SwiftUI

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
            case "oral":
                self = .oral
            case "insufflation":
                self = .insufflation
            case "enema":
                self = .enema
            case "rectal":
                self = .rectal
            case "intravenous":
                self = .intravenous
            default:
                fatalError()
        }
    }
}
