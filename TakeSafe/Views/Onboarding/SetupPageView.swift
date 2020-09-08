//
//  SetupPageView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-09-08.
//

import SwiftUI

struct SetupPageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        VStack {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            
            VStack {
                ContainedButton(title: "Review Permission") {
                    
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Skip")
                        .foregroundColor(.secondary)
                })
            }
        }
    }
}
