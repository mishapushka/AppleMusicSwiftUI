//
//  LibraryDescription.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 05.06.2021.
//

import SwiftUI

struct LibraryEmptyDescriptionView: View {
    var body: some View {

        VStack {
            Text("Ищете свою музыку?")
                .font(.system(size: 30))
                .bold()

            Text("Здесь появится купленная Вами в iTunes Store музыка")
                .font(.system(size: 22))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }.padding()
    }
}

