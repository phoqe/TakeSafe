//
//  Timeline.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-14.
//

import SwiftUI

struct Timeline: View {
    var onset: Double
    var duration: Double
    
    var body: some View {
        VStack {
            HStack {
                Text("\(Int(onset))")
                    .padding(.leading, 5)
                
                ProgressView(value: onset, total: duration + onset)
                    .padding(.horizontal)
                
                Text("\(Int(duration))")
                    .padding(.trailing, 5)
            }
            
            HStack {
                Label(title: {
                    Text(NSLocalizedString("timelineOnset", comment: ""))
                }, icon: {
                    Image(systemName: "circle.fill")
                        .foregroundColor(.accentColor)
                })
            }
        }
    }
}
