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
    @State var showAppleHealthAuthErrorAlert = false
    @Binding var onboardingState: OnboardingState
    
    init(_ views: [Page], _ onboardingState: Binding<OnboardingState>) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._onboardingState = onboardingState
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
                        if error != nil || !success {
                            showAppleHealthAuthErrorAlert = true
                            
                            return
                        }
                        
                        // TODO: Proceed.
                    }
                }
                .padding(.bottom)
                .alert(isPresented: $showHealthDataUnavailableAlert) {
                    Alert(title: Text(NSLocalizedString("healthDataUnavailableAlertTitle", comment: "")), message: Text(NSLocalizedString("healthDataUnavailableAlertMessage", comment: "")), dismissButton: .default(Text(NSLocalizedString("healthDataUnavailableAlertButton", comment: ""))))
                }
                .alert(isPresented: $showAppleHealthAuthErrorAlert) {
                    Alert(title: Text(NSLocalizedString("appleHealthAuthErrorAlertTitle", comment: "")), message: Text(NSLocalizedString("appleHealthAuthErrorAlertMessage", comment: "")), dismissButton: .default(Text(NSLocalizedString("appleHealthAuthErrorAlertButton", comment: ""))))
                }
                
                Button(action: {
                    // TODO: Skip.
                }, label: {
                    Text(NSLocalizedString("setupPageViewSkipButton", comment: ""))
                        .foregroundColor(.secondary)
                })
            }
            .padding()
        }
    }
}
