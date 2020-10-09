//
//  Timeline.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-07.
//

import SwiftUI

struct Timeline: View {
    var onset: DateComponents
    var duration: DateComponents
    var totalDuration: CGFloat
    
    init(onset: DateComponents, duration: DateComponents) {
        self.onset = onset
        self.duration = duration
        self.totalDuration = CGFloat(onset.hour! + duration.hour!)
    }
    
    var body: some View {
        HStack(spacing: -2) {
            ProgressView(value: 1)
                .progressViewStyle(LinearProgressViewStyle(tint: Color(.systemTeal)))
                .frame(width: totalDuration / CGFloat(onset.hour!))
            
            ProgressView(value: 1)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.black))
                .frame(width: totalDuration / CGFloat(duration.hour!))
        }
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline(onset: DateComponents(hour: 1), duration: DateComponents(hour: 4))
    }
}
