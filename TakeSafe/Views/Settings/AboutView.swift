//
//  AboutView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-12.
//

import SwiftUI
import BetterSafariView

struct AboutView: View {
    @State var showBuild = false
    @State var safariView = (isPresented: false, url: URL(string: "https://takesafe.app")!)
    
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
                Button(action: {
                    safariView = (isPresented: true, url: URL(string: "https://takesafe.app")!)
                }, label: {
                    HStack {
                        Text("Website")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                })
                .foregroundColor(.primary)
                
                Button(action: {
                    safariView = (isPresented: true, url: URL(string: "https://takesafe.app/terms")!)
                }, label: {
                    HStack {
                        Text("Terms of Service")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                })
                .foregroundColor(.primary)
                
                Button(action: {
                    safariView = (isPresented: true, url: URL(string: "https://takesafe.app/privacy")!)
                }, label: {
                    HStack {
                        Text("Privacy Policy")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                })
                .foregroundColor(.primary)
            }
        }
        .safariView(isPresented: $safariView.isPresented) {
            SafariView(url: safariView.url, configuration: SafariView.Configuration(
                entersReaderIfAvailable: true
            ))
        }
        .navigationBarTitle("About", displayMode: .inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
