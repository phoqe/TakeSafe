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
    @State var bedtime: Date
    @State var wakeUp: Date
    
    init(_ views: [Page], _ onboardingState: Binding<OnboardingState>) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._onboardingState = onboardingState
        
        var defaultBedtime = DateComponents()
        
        defaultBedtime.hour = 23
        defaultBedtime.minute = 0
        
        var defaultWakeUp = DateComponents()
        
        defaultWakeUp.hour = 7
        defaultWakeUp.minute = 0
        
        _bedtime = State(initialValue: Calendar.current.date(from: defaultBedtime)!)
        _wakeUp = State(initialValue: Calendar.current.date(from: defaultWakeUp)!)
    }
    
    func requestAppleHealthAccess() {
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
            
            currentPage = 1
        }
    }
    
    func setBedtime() {
        UserDefaults.standard.set(bedtime, forKey: "bedtime")
        
        currentPage = 2
    }
    
    func setWakeUp() {
        UserDefaults.standard.set(wakeUp, forKey: "wakeUp")
        
        currentPage = 3
    }
    
    func finish() {
        UserDefaults.standard.set(true, forKey: "hasOnboarded")
        
        onboardingState = .finished
    }
    
    var body: some View {
        VStack {
            SetupPageViewController(controllers: viewControllers, currentPage: $currentPage)
            
            if currentPage == 0 {
                VStack {
                    ContainedButton(title: NSLocalizedString("setupPageViewAppleHealthAccessButton", comment: ""), action: requestAppleHealthAccess)
                    .padding(.bottom)
                    .alert(isPresented: $showHealthDataUnavailableAlert) {
                        Alert(title: Text(NSLocalizedString("healthDataUnavailableAlertTitle", comment: "")), message: Text(NSLocalizedString("healthDataUnavailableAlertMessage", comment: "")), dismissButton: .default(Text(NSLocalizedString("healthDataUnavailableAlertButton", comment: ""))))
                    }
                    .alert(isPresented: $showAppleHealthAuthErrorAlert) {
                        Alert(title: Text(NSLocalizedString("appleHealthAuthErrorAlertTitle", comment: "")), message: Text(NSLocalizedString("appleHealthAuthErrorAlertMessage", comment: "")), dismissButton: .default(Text(NSLocalizedString("appleHealthAuthErrorAlertButton", comment: ""))))
                    }
                    
                    Button(action: {
                        currentPage = 1
                    }, label: {
                        Text(NSLocalizedString("setupPageViewSkipButton", comment: ""))
                            .foregroundColor(.secondary)
                    })
                }
                .padding()
            }
            
            if currentPage == 1 {
                VStack {
                    DatePicker("", selection: $bedtime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .background(Color.secondary.opacity(0.1))
                        .cornerRadius(15)
                        .padding()
                    
                    Button(action: setBedtime, label: {
                        Text(NSLocalizedString("onboardingSetupPage2Button", comment: ""))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Primary Color"))
                    })
                    .padding()
                }
                .padding()
            }
                
            if currentPage == 2 {
                VStack {
                    DatePicker("", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .background(Color.secondary.opacity(0.1))
                        .cornerRadius(15)
                        .padding()
                    
                    Button(action: setWakeUp, label: {
                        Text(NSLocalizedString("onboardingSetupPage3Button", comment: ""))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Primary Color"))
                    })
                    .padding()
                }
                .padding()
            }
            
            if currentPage == 3 {
                ContainedButton(title: NSLocalizedString("onboardingSetupPage4Button", comment: ""), action: finish)
                    .padding()
            }
        }
    }
}
