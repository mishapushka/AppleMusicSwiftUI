//
//  ArtistShowView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 07.06.2021.
//

import SwiftUI

struct StationView: View {
    private var items = StationModel.showItems
    private var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(items) { item in

                    HStack(alignment: .center) {
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 110)
                            .cornerRadius(6)

                        VStack(alignment: .leading) {
                            Text(item.stationName)
                                .font(.system(size: 18))
                                .multilineTextAlignment(.leading)
                                .font(.title3)
                            Text(item.stationType)
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                        }
                        .lineLimit(3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                    Divider()
                        .padding(.leading, 120)
                        .padding(.trailing, 10)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ArtistShowView_Previews: PreviewProvider {
    static var previews: some View {
        StationView()
    }
}
