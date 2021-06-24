//
//  ContentView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 31.05.2021.
//

import SwiftUI

struct ContentView: View {
    @State var current = 2

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom),
               content: {

                TabView(selection: $current) {

                    LibraryView()
                        .tag(0)
                        .tabItem {
                            Image(systemName: "music.note.house.fill")
                            Text("Медиатека")
                        }

                    RadioView()
                        .tag(1)
                        .tabItem {
                            Image(systemName: "dot.radiowaves.left.and.right")
                            Text("Радио")
                        }

                    SearchView()
                        .tag(2)
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Поиск")
                        }
                }

                Miniplayer()
               })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
