//
//  LibraryView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 01.06.2021.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        NavigationView {
            TabView {
                VStack {
                    Text("Ищете свою музыку?")
                        .font(.system(size: 30))
                        .fontWeight(.medium)
                    Text("Здесь появится купленная Вами в iTunes Store музыка")
                        .font(.system(size: 22))
                        .foregroundColor(.secondary)
                } .padding()
                .tabItem {
                    Image(systemName: "music.note.house.fill")
                    Text("Медиатека")
                }.tag(1)
                Text("Tab Content 2")
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Радио")
                    }.tag(2)
                Text("Tab Content 3")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                    }.tag(3)
            }
            .navigationTitle("Медиатека")
            .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Править")
            }))
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
