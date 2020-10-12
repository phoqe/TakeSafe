//
//  SettingsView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-09.
//

import SwiftUI
import HealthKit

struct SettingsView: View {
    @State var height = UserDefaults.standard.string(forKey: "height") ?? ""
    @State var weight = UserDefaults.standard.string(forKey: "weight") ?? ""
    @State var goToSleepTime = UserDefaults.standard.data(forKey: "goToSleepTime") as! Date? ?? Date()
    @State var wakeUpTime = UserDefaults.standard.data(forKey: "wakeUpTime") as! Date? ?? Date()
    
    let isAppleHealthConnected = UserDefaults.standard.bool(forKey: "isAppleHealthConnected")
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    
    var body: some View {
        NavigationView {
            Form {
                if HKHealthStore.isHealthDataAvailable() {
                    Section(header: Text("Apple Health"), footer: Text("We use Apple Health to improve pharmacological calculations. The data includes your height and weight.")) {
                        NavigationLink(destination: AppleHealthSettingView()) {
                            Text("Apple Health")
                            
                            Spacer()
                            
                            Text(isAppleHealthConnected ? "Connected" : "Not Connected")
                                .foregroundColor(.secondary)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                    }
                } else {
                    Section(header: Text("Body Measurements"), footer: Text("We use your body measurements to improve pharmacological calculations.")) {
                        HStack {
                            TextField("Height", text: $height)
                                .keyboardType(.decimalPad)
                            Text(UnitLength.centimeters.symbol)
                        }
                        
                        HStack {
                            TextField("Weight", text: $weight)
                                .keyboardType(.decimalPad)
                            Text(UnitMass.kilograms.symbol)
                        }
                    }
                }
                
                Section(header: Text("Sleep"), footer: Text("We use your sleep and wake up time to present information when drugs may disturb your sleep.")) {
                    DatePicker("Go to sleep", selection: $goToSleepTime, displayedComponents: .hourAndMinute)
                    DatePicker("Wake up", selection: $wakeUpTime, displayedComponents: .hourAndMinute)
                }
                
                Section(header: Text("About")) {
                    Link("Website", destination: URL(string: ProcessInfo.processInfo.environment["website"]!)!)

                    HStack {
                        Text("Version")
                        
                        Spacer()
                        
                        Text(version)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
