//
//  RadioStationView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 07.06.2021.
//

import SwiftUI

struct RadioStationView: View {
    private let items = RadioStationModel.stationItems
    private let rows = [ GridItem(.flexible(maximum: 200)) ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .top) {
                ForEach(items, id: \.self) { item in

                    VStack {
                        Text(item.stationType)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 20))
                            .foregroundColor(.secondary)

                        Text(item.musicType)
                            .frame(maxWidth: 380, alignment: .leading)
                            .font(.system(size: 22))
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)

                        Text(item.slogan)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 22))
                            .foregroundColor(.secondary)
                            .padding(.bottom, 1)

                        Image(item.image)
                            .resizable()
                            .frame(width: 380, height: 250)
                            .cornerRadius(6)
                    }
                }
            }.padding(.leading)
        }
    }
}

struct RadioStationView_Previews: PreviewProvider {
    static var previews: some View {
        RadioStationView()
    }
}
