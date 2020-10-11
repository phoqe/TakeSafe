//
//  AppleHealthSettingView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-11.
//

import SwiftUI

struct AppleHealthSettingView: View {
    var body: some View {
        VStack {
            Image("Medicine")
                .resizable()
                .frame(width: 275, height: 200)
            
            VStack {
                Text("Connect Apple Health")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom)
                
                Text("awdawdawd")
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            
            Form {
                Button("Connect") {
                    
                }
            }
        }
    }
}

struct AppleHealthSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AppleHealthSettingView()
    }
}
