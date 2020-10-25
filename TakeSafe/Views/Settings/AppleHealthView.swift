//
//  AppleHealthView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-23.
//

import SwiftUI

struct AppleHealthView: View {
    var body: some View {
        VStack {
            Image("Doctors")
                .resizable()
                .frame(width: 300, height: 225, alignment: .center)
                .padding()
            
            VStack {
                Text("Connect us with Apple Health.")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom, 2.5)
                
                Text("We can use data from Apple Health to give you info and advice in realtime. For example, we’ll tell you if a drug will disturb your sleep before you take it.")
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            
            Button(action: {
                
            }, label: {
                Text("Connect Apple Health")
                    .font(.title3)
                    .fontWeight(.semibold)
            })
        }
        .navigationBarTitle("Apple Health")
    }
}

struct AppleHealthView_Previews: PreviewProvider {
    static var previews: some View {
        AppleHealthView()
    }
}
