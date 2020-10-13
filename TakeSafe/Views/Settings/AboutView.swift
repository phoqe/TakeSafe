//
//  AboutView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-12.
//

import SwiftUI

struct AboutView: View {
    @State var showBuild = false
    
    let name = Bundle.main.infoDictionary!["CFBundleName"] as! String
    let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    let build = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    
    var body: some View {
        Form {
            HStack {
                Text("Version")
                
                Spacer()
                
                Button(showBuild ? "\(version) (\(build))" : version) {
                    showBuild.toggle()
                }
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.secondary)
            }
            
            Section(header: Text("Links")) {
                Link("Website", destination: URL(string: "https://takesafe.app")!)
                Link("Terms of Use", destination: URL(string: "https://takesafe.app/terms")!)
                Link("Privacy Policy", destination: URL(string: "https://takesafe.app/privacy")!)
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
