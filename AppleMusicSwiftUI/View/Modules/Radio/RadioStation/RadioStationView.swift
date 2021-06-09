//
//  RadioStationView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 07.06.2021.
//

import SwiftUI

struct RadioStationView: View {
    private let items = RadioStationModel.stationItems
    private let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(items, id: \.self) { item in

                        Text(item.stationType)
                        Text(item.musicType)
                        Text(item.slogan)
                        Image(item.image)

                }
            }.frame(height: 150)
        }
    }
}

struct RadioStationView_Previews: PreviewProvider {
    static var previews: some View {
        RadioStationView()
    }
}
