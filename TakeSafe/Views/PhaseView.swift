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
    
    func image() -> String {
        switch type {
            case .total:
                return ""
            case .onset:
                return "To the Stars"
            case .comeUp:
                return "Outer Space"
            case .peak:
                return "Launch Day"
            case .offset:
                return "To the Moon"
            case .afterEffects:
                return "Relaunch Day"
        }
    }
    
    var body: some View {
        VStack(spacing: 25) {
            Image(image())
                .resizable()
                .frame(width: 175, height: 125)
            
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
                
                Text("You‘re in the Offset phase. The effects will begin to diminish.")
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
