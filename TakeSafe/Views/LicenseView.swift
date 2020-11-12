//
//  LicenseView.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-12.
//

import SwiftUI

struct LicenseView: View {
    var package: Package

    var body: some View {
        VStack {
            Text(package.license.title)
                .font(.title2)
                .bold()
                .padding(.bottom)

            Text(package.license.body)
                .padding(.horizontal)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .navigationBarTitle(package.name, displayMode: .inline)
    }
}

struct LicenseView_Previews: PreviewProvider {
    static var previews: some View {
        LicenseView(package: Meta.packages[0])
    }
}
