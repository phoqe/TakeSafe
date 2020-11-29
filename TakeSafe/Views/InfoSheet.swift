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
    var text: String

    var body: some View {
        ScrollView() {
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 300, height: 225)
                    .padding(.bottom, 10)

                VStack {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)

                    Text(text)
                        .lineSpacing(5)
                }
                .padding(.horizontal, 30)

                Spacer()
            }
            .padding(.top, 30)
            .padding(.bottom)
        }
    }
}

struct InfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        let image = "Doctors"
        let title = "The Neuropsychology of Addiction"
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus commodo viverra maecenas accumsan lacus vel facilisis volutpat. Ut ornare lectus sit amet est placerat in egestas. Laoreet id donec ultrices tincidunt arcu non sodales neque sodales. Risus nec feugiat in fermentum posuere urna nec tincidunt praesent."

        InfoSheet(image: image, title: title, text: text)
    }
}
