//
//  API.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-16.
//

import Foundation

struct API {
    static let baseUrl = URL(string: "https://dev.takesafe.app/api/")!
    
    static func drugsUrl() -> URL {
        let endpointUrl = baseUrl.appendingPathComponent("drugs")
        var components = URLComponents(url: endpointUrl, resolvingAgainstBaseURL: false)!
        let languageCode = Locale.current.languageCode
        
        switch languageCode {
            case "en", "sv":
                components.queryItems = [URLQueryItem(name: "lang", value: languageCode)]
            default:
                break
        }
        
        return components.url!
    }
}
