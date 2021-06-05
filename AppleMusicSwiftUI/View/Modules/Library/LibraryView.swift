//
//  LibraryView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 01.06.2021.
//

import SwiftUI

struct LibraryView: View {

    @State private var showFilter = false
    @State private var editMode = EditMode.active

    var body: some View {
        NavigationView {
            VStack {
                if showFilter {
                    LibraryItem()
                } else {
                    LibraryDescription()
                }
            }
            .navigationTitle("Медиатека")
            .accentColor(.red)
            .environment(\.editMode,
                         .constant(showFilter ? EditMode.active : EditMode.inactive))
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showFilter.toggle()
                                    }, label: {
                                        if showFilter {
                                            Text("Править")
                                                .font(.system(size: 17))
                                                .foregroundColor(.red)

                                        } else {
                                            Text("Готово")
                                                .font(.system(size: 17))
                                                .foregroundColor(.red)
                                        }
                                    }))
        }
    }
}

