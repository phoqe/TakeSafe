//
//  SettingsView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-09.
//

import SwiftUI
import HealthKit

struct SettingsView: View {
    @ObservedObject var settings = Settings()
    @State var appleHealthConnected = UserDefaults.standard.bool(forKey: "appleHealthConnected")
    @State var showAppleHealthAlert = false
    
    let name = Bundle.main.infoDictionary!["CFBundleName"] as! String
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    if appleHealthConnected {
                        HStack {
                            Text("Apple Health")

                            Spacer()

                            Text("Connected")
                                .foregroundColor(.secondary)
                        }
                    } else {
                        Button("Connect Apple Health") {
                            HealthManager.shared.requestAuthorization { (success, error) in
                                if error != nil || !success {
                                    appleHealthConnected = false
                                    showAppleHealthAlert = true

                                    return
                                }

                                appleHealthConnected = true
                                showAppleHealthAlert = false
                            }
                        }
                        .alert(isPresented: $showAppleHealthAlert) {
                            Alert(title: Text(NSLocalizedString("appleHealthAuthErrorAlertTitle", comment: "")), message: Text(NSLocalizedString("appleHealthAuthErrorAlertMessage", comment: "")), dismissButton: .default(Text(NSLocalizedString("appleHealthAuthErrorAlertButton", comment: ""))))
                        }
                    }
                }

                if let healthStore = HealthManager.shared.healthStore, let biologicalSex = try? healthStore.biologicalSex().biologicalSex, biologicalSex == .female {
                    Section(footer: Text("We tailor drug and dosage information in regards to your pregnancy.")) {
                        Toggle("Pregnancy Mode", isOn: $settings.pregnancyMode)
                    }
                }
                
                Section() {
                    DatePicker(NSLocalizedString("settingsGoToSleep", comment: ""), selection: $settings.bedtime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(CompactDatePickerStyle())
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
