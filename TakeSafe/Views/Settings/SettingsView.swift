//
//  SettingsView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-09.
//

import SwiftUI
import HealthKit

struct SettingsView: View {
    @State var goToSleepTime = UserDefaults.standard.data(forKey: "goToSleepTime") as! Date? ?? Date()
    @State var wakeUpTime = UserDefaults.standard.data(forKey: "wakeUpTime") as! Date? ?? Date()
    
    let name = Bundle.main.infoDictionary!["CFBundleName"] as! String
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    DatePicker(NSLocalizedString("settingsGoToSleep", comment: ""), selection: $goToSleepTime, displayedComponents: .hourAndMinute)
                    DatePicker(NSLocalizedString("settingsWakeUp", comment: ""), selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                }
                
                NavigationLink(destination: AboutView()) {
                    Text(NSLocalizedString("settingsAbout", comment: ""))
                }
            }
            .navigationBarTitle(NSLocalizedString("settingsTitle", comment: ""), displayMode: .inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
