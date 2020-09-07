//
//  AppDelegate.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-07.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UserDefaults.standard.set("#F45B69", forKey: "primaryColor")
        
        return true
    }
}
