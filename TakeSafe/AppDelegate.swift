//
//  AppDelegate.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        registerUserDefaults()

        // TODO: Request in Onboarding.
        NotificationManager.shared.requestAuthorization { (granted, error) in
            
        }
        
        return true
    }
    
    private func registerUserDefaults() {
        var bedtime = DateComponents()
        
        bedtime.hour = 23
        bedtime.minute = 0
        
        UserDefaults.standard.register(defaults: [
            "pregnancyMode": false,
            "bedtime": Calendar.current.date(from: bedtime)!,
            "activeDrugs": [],
            "appleHealthConnected": false
        ])
    }
}
