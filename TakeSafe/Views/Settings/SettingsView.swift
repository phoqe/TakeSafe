//
//  SettingsView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-09.
//

import SwiftUI
import HealthKit

struct SettingsView: View {
    @State var bedtime = UserDefaults.standard.object(forKey: "bedtime") as! Date
    @State var waketime = UserDefaults.standard.object(forKey: "waketime") as! Date
    @State var pregnancyMode = UserDefaults.standard.bool(forKey: "pregnancyMode")
    
    let name = Bundle.main.infoDictionary!["CFBundleName"] as! String
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    NavigationLink(destination: Text("Apple Health")) {
                        Text("Apple Health")
                    }
                }
                
                Section(footer: Text("We tailor drug and dosage information in regards to your pregnancy.")) {
                    Toggle(isOn: $pregnancyMode) {
                        Text("Pregnancy Mode")
                    }
                }
                
                Section(header: Text("settingsSleep")) {
                    HStack {
                        Text("settingsGoToSleep")
                        
                        Spacer()
                        
                        DatePicker(NSLocalizedString("settingsGoToSleep", comment: ""), selection: $bedtime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(GraphicalDatePickerStyle())
                    }
                    
                    HStack {
                        Text("settingsWakeUp")
                        
                        Spacer()
                        
                        DatePicker(NSLocalizedString("settingsWakeUp", comment: ""), selection: $waketime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(GraphicalDatePickerStyle())
                    }
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
