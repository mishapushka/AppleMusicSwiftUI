//
//  LibraryItem.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 03.06.2021.
//

import Foundation
import SwiftUI

struct LibraryListItemView: View {
    private var categories = LibraryItemModel.items

    @State private var multiSelection = Set<UUID>()

    var body: some View {
        List(selection: $multiSelection) {
            ForEach(categories) {category in
                HStack {
                    Image(systemName: category.icon)
                        .foregroundColor(.red)
                    Text(category.name)
                }
                .font(.system(size: 20))
            }
            .onMove(perform: { indices, newOffset in })
        }
        .listStyle(InsetListStyle())
    }
}

