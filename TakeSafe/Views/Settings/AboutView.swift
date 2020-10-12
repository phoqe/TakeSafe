//
//  AboutView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-12.
//

import SwiftUI

struct AboutView: View {
    let name = Bundle.main.infoDictionary!["CFBundleName"] as! String
    let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    
    var body: some View {
        Form {
            Section(header: Text("Links")) {
                Link("Website", destination: URL(string: "https://takesafe.app")!)
                Link("Terms and Conditions", destination: URL(string: "https://takesafe.app/terms")!)
                Link("Privacy Policy", destination: URL(string: "https://takesafe.app/privacy")!)
            }
            
            Section(header: Text("Version")) {
                HStack {
                    Text("Version")
                    
                    Spacer()
                    
                    Text(version)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationBarTitle("About \(name)", displayMode: .inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
