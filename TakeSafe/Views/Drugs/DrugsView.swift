//
//  DrugsView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-10-08.
//

import SwiftUI

struct DrugsView: View {
    @State var loading = false
    @State var error = false
    @State var drugs: [Drug]? = nil
    
    func getDrugs() {
        loading = true
        error = false
        drugs = nil
        
        guard let url = URL(string: "https://takesafe.app/api/drugs") else {
            loading = false
            error = true
            drugs = nil
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            loading = false
            
            if error != nil {
                self.error = true
                
                return
            }
            
            guard let data = data else {
                self.drugs = nil
                
                return
            }
            
//            guard let drugs = try? JSONDecoder().decode([Drug].self, from: data) else {
//                self.error = true
//            }
//
//            self.drugs = drugs
        }.resume()
    }
    
    var body: some View {
        NavigationView {
            Group {
                if loading {
                    ProgressView()
                } else if error {
                    Text("Error")
                } else if drugs == nil {
                    Text("Empty")
                } else {
                    List {
                        
                    }
                }
            }
            .navigationBarTitle("Drugs")
        }
        .onAppear(perform: getDrugs)
    }
}

struct DrugsView_Previews: PreviewProvider {
    static var previews: some View {
        DrugsView()
    }
}
