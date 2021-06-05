//
//  LibraryView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 01.06.2021.
//

import SwiftUI

struct LibraryView: View {
    @State private var willMoveToNextScreen = false

    var body: some View {
        NavigationView {
                VStack {
                    Text("Ищете свою музыку?")
                        .font(.system(size: 30))
                        .fontWeight(.medium)

                    Text("Здесь появится купленная Вами в iTunes Store музыка")
                        .font(.system(size: 22))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                } .padding()
            .navigationTitle("Медиатека")
            .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                NavigationLink(destination: ListViewModel()) {
                Text("Править")
                    .fontWeight(.regular)
                    .foregroundColor(.red)
                }
            }))
        }
    }
}
