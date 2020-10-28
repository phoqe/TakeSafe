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
    
    @AppStorage("pregnancyMode") var pregnancyMode: Bool = UserDefaults.standard.bool(forKey: "pregnancyMode")
    
    let name = Bundle.main.infoDictionary!["CFBundleName"] as! String
    let appleHealthConnected = UserDefaults.standard.bool(forKey: "appleHealthConnected")
    
    var body: some View {
        NavigationView {
            Form {
                Section(footer: appleHealthConnected ? nil : Text("We can use data from Apple Health to give you info and advice in realtime.")) {
                    if appleHealthConnected {
                        NavigationLink(destination: AppleHealthView()) {
                            HStack {
                                Text("Apple Health")
                                
                                Spacer()
                                
                                Text("Connected")
                                    .foregroundColor(.secondary)
                            }
                        }
                    } else {
                        Button("Connect Apple Health") {
                            HealthManager.shared.requestAuthorization { (success, error) in
                                if error != nil || !success {
//                                    showAppleHealthAuthErrorAlert = true
                                    
                                    return
                                }
                                
//                                currentPage = 1
                            }
                        }
                    }
                }
                
                Section(footer: Text("We tailor drug and dosage information in regards to your pregnancy.")) {
                    Toggle("Pregnancy Mode", isOn: $pregnancyMode)
                }
                
                Section() {
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
