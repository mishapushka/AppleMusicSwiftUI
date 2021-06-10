//
//  RadioView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 07.06.2021.
//

import SwiftUI

struct RadioView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Divider()
                        .padding(.top, 4)
                    RadioStationView()
                        .frame(height: 300)

                    Divider()
                        .padding(.top, 4)
                    Text("Шоу артистов")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 23))
                        .padding()
                    ArtistShowView()
                }
            }
            .navigationBarTitle("Радио")
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
