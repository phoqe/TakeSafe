//
//  LicenseListItem.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-12.
//

import SwiftUI

struct LicenseListItem: View {
    var package: Package

    var body: some View {
        NavigationLink(destination: LicenseView(package: package)) {
            if let author = package.author {
                VStack(alignment: .leading) {
                    Text(package.name)
                        .padding(.bottom, -2.5)
                    
                    Text(author)
                        .foregroundColor(.secondary)
                }
            } else {
                Text(package.name)
            }

            Spacer()

            Text(package.license.name)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 5)
    }
}

struct LicenseListItem_Previews: PreviewProvider {
    static var previews: some View {
        LicenseListItem(package: Meta.packages[0])
    }
}
