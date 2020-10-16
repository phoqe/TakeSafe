//
//  Timeline.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-14.
//

import SwiftUI

struct Timeline: View {
    var onset: DateComponents
    var duration: DateComponents
    
    var body: some View {
        VStack {
            HStack {
                Text("\(Int(onset.hour!))")
                    .padding(.leading, 5)
                
                ProgressView(value: Double(onset.hour!), total: Double(duration.hour! + onset.hour!))
                    .padding(.horizontal)
                
                Text("\(Int(duration.hour!))")
                    .padding(.trailing, 5)
            }
            
            HStack {
                Label(title: {
                    Text(NSLocalizedString("timelineOnset", comment: ""))
                },icon: {
                    Image(systemName: "circle.fill")
                        .foregroundColor(.accentColor)
                })
            }
        }
    }
}
