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
    @State var drugs: [Drug] = []
    
    func getDrugs() {
        if !drugs.isEmpty {
            return
        }
        
        loading = true
        error = false
        drugs = []
        
        guard let url = URL(string: "https://takesafe.app/api/drugs") else {
            loading = false
            error = true
            drugs = []
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                loading = false
                self.error = true
                
                return
            }
            
            guard let data = data else {
                loading = false
                self.drugs = []
                
                return
            }
            
            guard let drugs = try? JSONDecoder().decode([Drug].self, from: data) else {
                loading = false
                self.error = true
                
                return
            }

            loading = false
            self.drugs = drugs
        }.resume()
    }
    
    var body: some View {
        NavigationView {
            Group {
                if loading {
                    ProgressView()
                } else if error {
                    EmptyState(image: "Server Down", title: "Couldn’t fetch drug list.", description: "Try again later. It may be fixed by then.")
                } else if drugs.isEmpty {
                    EmptyState(image: "Empty", title: "No drugs in store.", description: "Looks like there are no drugs available.")
                } else {
                    Form {
                        List(drugs) { drug in
                            NavigationLink(destination: DrugView(drug: drug)) {
                                Text(drug.name)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Drugs", displayMode: .inline)
        }
        .onAppear(perform: getDrugs)
    }
}

struct DrugsView_Previews: PreviewProvider {
    static var previews: some View {
        DrugsView()
    }
}
