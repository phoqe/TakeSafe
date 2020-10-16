//
//  DrugGroupBox.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-16.
//

import SwiftUI

struct DrugGroupBox: View {
    var drug: Drug
    
    var body: some View {
        GroupBox(label:
            Label(title: {
                HStack {
                    Text(drug.name)
                    
                    Spacer()
                }
            }, icon: {
                Image(systemName: "pills.fill")
            })
        ) {
            
        }
    }
}
