//
//  SetupPageView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-08.
//

import SwiftUI
import HealthKit

struct SetupPageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    @State var showHealthDataUnavailableAlert = false
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        VStack {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            
            VStack {
                ContainedButton(title: NSLocalizedString("setupPageViewAppleHealthAccessButton", comment: "")) {
                    if !HKHealthStore.isHealthDataAvailable() {
                        showHealthDataUnavailableAlert = true
                        
                        return
                    }
                    
                    // TODO: Move to manager.
                    let healthStore = HKHealthStore()
                    
                    // Characteristics
                    let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth)
                    let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex)
                    
                    // Quantity
                    let height = HKObjectType.quantityType(forIdentifier: .height)
                    let bodyMass = HKObjectType.quantityType(forIdentifier: .bodyMass)
                    let heartRate = HKObjectType.quantityType(forIdentifier: .heartRate)
                    let restingHeartRate = HKObjectType.quantityType(forIdentifier: .restingHeartRate)
                    let walkingHearRateAverage = HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage)
                    let heartRateVariabilitySDNN = HKObjectType.quantityType(forIdentifier: .heartRateVariabilitySDNN)
                    let bodyTemperature = HKObjectType.quantityType(forIdentifier: .bodyTemperature)
                    
                    let types = Set([
                        dateOfBirth!,
                        biologicalSex!,
                        
                        height!,
                        bodyMass!,
                        heartRate!,
                        restingHeartRate!,
                        walkingHearRateAverage!,
                        heartRateVariabilitySDNN!,
                        bodyTemperature!
                    ])
                    
                    healthStore.requestAuthorization(toShare: nil, read: types) { (success, error) in
                        
                    }
                }
                .padding(.bottom)
                .alert(isPresented: $showHealthDataUnavailableAlert) {
                    Alert(title: Text(NSLocalizedString("healthDataUnavailableAlertTitle", comment: "")), message: Text(NSLocalizedString("healthDataUnavailableAlertMessage", comment: "")), dismissButton: .default(Text(NSLocalizedString("healthDataUnavailableAlertButton", comment: ""))))
                }
                
                Button(action: {
                    
                }, label: {
                    Text(NSLocalizedString("setupPageViewSkipButton", comment: ""))
                        .foregroundColor(.secondary)
                })
            }
            .padding()
        }
    }
}
