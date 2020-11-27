//
//  InfoSheet.swift
//  TakeSafe
//
//  Created by Linus Långberg on 2020-11-26.
//

import SwiftUI

struct InfoSheet: View {
    var image: String
    var title: String
    var subtitle: String?
    var text: String

    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 300, height: 225)
                .padding(.bottom)

            VStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)

                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.body)
                        .padding(.top, 5)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)

            Text(text)
                .padding(.horizontal, 30)
                .lineSpacing(5)

            Spacer()
        }
        .padding(.vertical)
    }
}

struct InfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        let image = "Doctors"
        let title = "The Neuropsychology of Addiction"
        let subtitle = "TL;DR LSD is not addictive."
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus commodo viverra maecenas accumsan lacus vel facilisis volutpat. Ut ornare lectus sit amet est placerat in egestas. Laoreet id donec ultrices tincidunt arcu non sodales neque sodales. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent."

        InfoSheet(image: image, title: title, subtitle: subtitle, text: text)
    }
}
