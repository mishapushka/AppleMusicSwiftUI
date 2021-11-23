//
//  LibraryItemModel.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 07.06.2021.
//

import Foundation

struct LibraryItemModel: Identifiable {
    var id = UUID()
    var icon: String
    var name: String
}
extension LibraryItemModel {
    static var items = [
        LibraryItemModel(icon: "music.note.list", name: "Плейлисты"),
        LibraryItemModel(icon: "music.mic", name: "Артисты"),
        LibraryItemModel(icon: "square.stack", name: "Альбомы"),
        LibraryItemModel(icon: "music.note", name: "Песни"),
        LibraryItemModel(icon: "tv", name: "Телешоу и фильмы"),
        LibraryItemModel(icon: "tv.music.note", name: "Видеоклипы"),
        LibraryItemModel(icon: "guitars", name: "Жанры"),
        LibraryItemModel(icon: "person.2.square.stack", name: "Сборники"),
        LibraryItemModel(icon: "music.quarternote.3", name: "Авторы"),
        LibraryItemModel(icon: "arrow.down.circle", name: "Загружено"),
        LibraryItemModel(icon: "music.note.house", name: "Домашняя коллекция")
    ]
}
