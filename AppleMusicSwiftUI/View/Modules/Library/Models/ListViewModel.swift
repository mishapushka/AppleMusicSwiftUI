//
//  ListViewModel.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 03.06.2021.
//

import Foundation
import SwiftUI

struct ListItem: Identifiable, Hashable {
    var id = UUID()
    var icon: String
    var name: String
}
var items = [
    ListItem(icon: "music.note.list", name: "Плейлисты"),
    ListItem(icon: "music.mic", name: "Артисты"),
    ListItem(icon: "square.stack", name: "Альбомы"),
    ListItem(icon: "music.note", name: "Песни"),
    ListItem(icon: "tv", name: "Телешоу и фильмы"),
    ListItem(icon: "tv.music.note", name: "Видеоклипы"),
    ListItem(icon: "guitars", name: "Жанры"),
    ListItem(icon: "person.2.square.stack", name: "Сборники"),
    ListItem(icon: "music.quarternote.3", name: "Авторы"),
    ListItem(icon: "arrow.down.circle", name: "Загружено"),
    ListItem(icon: "music.note.house", name: "Домашняя коллекция")
]

struct ListViewModel: View {

    @State private var multiSelection = Set<UUID>()

    var body: some View {
        NavigationView {
            List(selection: $multiSelection) {
                ForEach(items) {item in
                    HStack {
                        Image(systemName: item.icon)
                            .foregroundColor(.red)
                            .font(.system(size: 20))
                        Text(item.name)
                            .font(.system(size: 20))
                    }
                }
            }
            .navigationTitle("Медиатека")
            .toolbar { EditButton() }
            .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Готово")
                    .fontWeight(.medium)
                    .foregroundColor(.red)
            }))
        }
    }
}


struct ListViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ListViewModel()
    }
}
