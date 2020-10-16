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
        
        URLSession.shared.dataTask(with: API.drugsUrl()) { data, response, error in
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
            
            let decoder = JSONDecoder()
            
            guard let drugs = try? decoder.decode([Drug].self, from: data) else {
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
                    EmptyState(title: NSLocalizedString("drugsErrorTitle", comment: ""), description: NSLocalizedString("drugsErrorDescription", comment: ""))
                } else if drugs.isEmpty {
                    EmptyState(title: NSLocalizedString("drugsEmptyTitle", comment: ""), description: NSLocalizedString("drugsEmptyDescription", comment: ""))
                } else {
                    Form {
                        DrugList(drugs: drugs)
                    }
                }
            }
            .navigationBarTitle(NSLocalizedString("drugsTitle", comment: ""), displayMode: .inline)
        }
        .onAppear(perform: getDrugs)
    }
}

struct DrugsView_Previews: PreviewProvider {
    static var previews: some View {
        DrugsView()
    }
}
