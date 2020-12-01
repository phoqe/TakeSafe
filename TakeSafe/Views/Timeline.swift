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

    var body: some View {
        VStack {
            HStack() {
                Text("0")

                HStack(spacing: 0) {
                    ForEach(filteredDuration, id: \.type) { durationComponent in
                        let rounded = durationComponent == filteredDuration.last || durationComponent == filteredDuration.first

                        Rectangle()
                            .frame(width: 100, height: 10)
                            .foregroundColor(durationComponent.type.foregroundColor())
                    }
                }

                Text("\(Int(totalComponent.end))")
            }

            HStack {
                ForEach(filteredDuration, id: \.type) { durationComponent in
                    Label(title: {
                        if durationComponent == filteredDuration.last {
                            Text(durationComponent.type.localizedName)
                                .font(.footnote)
                        } else {
                            Text(durationComponent.type.localizedName)
                                .font(.footnote)
                                .padding(.trailing)
                        }
                    }, icon: {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 7.5, height: 7.5)
                            .foregroundColor(durationComponent.type.foregroundColor())
                    })
                }
            }
        }
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        let duration: [DurationComponent] = [
            DurationComponent(type: .total, start: 8.0, end: 12.0),
            DurationComponent(type: .onset, start: 0.25, end: 0.5),
            DurationComponent(type: .comeUp, start: 0.75, end: 1.5),
            DurationComponent(type: .peak, start: 3.0, end: 5.0),
            DurationComponent(type: .offset, start: 3.0, end: 5.0),
            DurationComponent(type: .afterEffects, start: 12.0, end: 48.0)
        ]

        Timeline(duration: duration)
    }
}
