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
    let isAppleHealthConnected = UserDefaults.standard.bool(forKey: "isAppleHealthConnected")
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Apple Health"), footer: Text("We use Apple Health to improve pharmacological calculations.")) {
                    NavigationLink(destination: AppleHealthView()) {
                        Text("Apple Health")
                        
                        Spacer()
                        
                        Text(isAppleHealthConnected ? "Connected" : "Not Connected")
                            .foregroundColor(.secondary)
                            .fixedSize(horizontal: true, vertical: false)
                    }
                }
                
                Section(header: Text("Sleep"), footer: Text("We use the time you go to sleep and wake up to provide recommendations when drugs may disturb your sleep.")) {
                    DatePicker("Go to sleep", selection: $goToSleepTime, displayedComponents: .hourAndMinute)
                    DatePicker("Wake up", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                }
                    
                Section(header: Text("About"), footer: Text("Made with ❤️ by Phoqe")) {
                    NavigationLink(destination: AboutView()) {
                        Text("About \(name)")
                    }
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
