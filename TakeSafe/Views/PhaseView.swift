//
//  PhaseView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-12-10.
//

import SwiftUI

struct PhaseView: View {
    var durationComponent: DurationComponent
    var type: DurationType
    
    init(durationComponent: DurationComponent) {
        self.durationComponent = durationComponent
        self.type = durationComponent.type
    }
    
    func image() -> (String, CGFloat, CGFloat) {
        switch type {
            case .total:
                return ("", 0, 0)
            case .onset:
                return ("To the Stars", 175, 125)
            case .comeUp:
                return ("Outer Space", 175, 125)
            case .peak:
                return ("Launch Day", 150, 125)
            case .offset:
                return ("To the Moon", 175, 150)
            case .afterEffects:
                return ("Relaunch Day", 150, 125)
        }
    }
    
    var body: some View {
        VStack(spacing: 25) {
            Image(image().0)
                .resizable()
                .frame(width: image().1, height: image().2)
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    Text("Offset")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text(type.localizedName)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(type.foregroundColor())
                    
                    Text("Offset")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                }
                
                Text("\(type.rawValue)-description".localized())
                    .padding(.horizontal)
            }
        }
    }
}

struct PhaseView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseView(durationComponent: DurationComponent(type: .onset, start: 3600, end: 36000))
        PhaseView(durationComponent: DurationComponent(type: .comeUp, start: 3600, end: 36000))
        PhaseView(durationComponent: DurationComponent(type: .peak, start: 3600, end: 36000))
        PhaseView(durationComponent: DurationComponent(type: .offset, start: 3600, end: 36000))
        PhaseView(durationComponent: DurationComponent(type: .afterEffects, start: 3600, end: 36000))
    }
}
