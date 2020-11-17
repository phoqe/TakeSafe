//
//  AppDelegate.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import UIKit
import Sentry

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        registerUserDefaults()
        initSentry()
        
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
    
    private func initSentry() {
        #if DEBUG
        SentrySDK.start { options in
            options.dsn = "https://c240b52932dd44fea8881c923b247919@o477651.ingest.sentry.io/5519014"
            options.debug = true
        }
        #else
        SentrySDK.start { options in
            options.dsn = "https://c240b52932dd44fea8881c923b247919@o477651.ingest.sentry.io/5519014"
            options.debug = false
        }
        #endif
    }
}
