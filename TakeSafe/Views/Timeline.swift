//
//  Timeline.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-30.
//

import SwiftUI

struct Timeline: View {
    var duration: [DurationComponent]
    var filteredDuration: [DurationComponent]
    var totalComponent: DurationComponent

    init(duration: [DurationComponent]) {
        self.duration = duration
        self.filteredDuration = duration.filter { $0.type != .total && $0.type != .afterEffects }
        self.totalComponent = duration.filter { $0.type == .total }.first!
    }
    
    func durationString() -> String? {
        guard let component = duration.filter({ $0.type == .total }).first else {
            return nil
        }
        
        let start = component.start.format(using: [.hour, .minute])
        let end = component.end.format(using: [.hour, .minute])
        
        return "\(start)–\(end)"
    }
    
    func afterEffectsString() -> String? {
        guard let component = duration.filter({ $0.type == .afterEffects }).first else {
            return nil
        }
        
        let start = component.start.format(using: [.hour, .minute])
        let end = component.end.format(using: [.hour, .minute])
        
        return "\(start)–\(end)"
    }

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 50) {
                if let duration = durationString() {
                    VStack(spacing: 5) {
                        Text("Duration")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(duration)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                }
                
                if let afterEffects = afterEffectsString() {
                    VStack(spacing: 5) {
                        Text("afterEffects")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(afterEffects)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                }
            }

            HStack(spacing: 0) {
                ForEach(filteredDuration, id: \.type) { durationComponent in
                    let start = durationComponent.start.format(using: [.hour, .minute])
                    let end = durationComponent.end.format(using: [.hour, .minute])
                    
                    VStack(spacing: 10) {
                        Text("\(start)–\(end)")
                            .font(.footnote)
                            .foregroundColor(durationComponent.type.foregroundColor())

                        Rectangle()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 5)
                            .foregroundColor(durationComponent.type.foregroundColor())
                        
                        Text(durationComponent.type.localizedName)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(durationComponent.type.foregroundColor())
                    }
                }
            }
        }
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        let duration: [DurationComponent] = [
            DurationComponent(type: .total, start: 28800, end: 43200),
            DurationComponent(type: .onset, start: 900, end: 1800),
            DurationComponent(type: .comeUp, start: 2700, end: 5400),
            DurationComponent(type: .peak, start: 10800, end: 18000),
            DurationComponent(type: .offset, start: 10800, end: 18000),
            DurationComponent(type: .afterEffects, start: 43200, end: 172800)
        ]

        Timeline(duration: duration)
    }
}
