//
//  ArtistShowView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 07.06.2021.
//

import SwiftUI

struct ArtistShowView: View {
    private var items = ArtistShowModel.showItems
    private var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(items) { item in

                    HStack(alignment: .center) {
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(15)

                        VStack {
                            Text(item.showType)
                                .font(.system(size: 22))
                            Text(item.artistName ?? "")
                                .font(.system(size: 18))
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                        }.lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                    Divider()
                }
            }.padding(.horizontal)
        }
    }
}

struct ArtistShowView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistShowView()
    }
}
