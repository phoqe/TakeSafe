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
    
    let isAppleHealthConnected = UserDefaults.standard.bool(forKey: "isAppleHealthConnected")
    
    var body: some View {
        NavigationView {
            Form {
                if HKHealthStore.isHealthDataAvailable() {
                    Section(header: Text("Apple Health"), footer: Text("Apple Health is used to improve pharmacological calculations. We use data like your height and weight.")) {
                        NavigationLink(destination: AppleHealthSettingView()) {
                            Text("Apple Health")
                            
                            Spacer()
                            
                            Text(isAppleHealthConnected ? "Connected" : "Not Connected")
                                .foregroundColor(.secondary)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                    }
                } else {
                    Section(header: Text("Body Measurements"), footer: Text("We use this data to improve pharmacological calculations.")) {
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
