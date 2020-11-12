//
//  LicenseList.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-12.
//

import SwiftUI

struct LicenseList: View {
    var body: some View {
        List(Meta.packages) { package in
            LicenseListItem(package: package)
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle("Licenses", displayMode: .inline)
    }
}

struct LicenseList_Previews: PreviewProvider {
    static var previews: some View {
        LicenseList()
    }
}
