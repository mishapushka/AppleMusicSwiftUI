//
//  ArtistShowModel.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 07.06.2021.
//

import Foundation

struct StationModel: Identifiable {
    var id = UUID().uuidString
    var stationName: String
    var stationType: String
    var image: String
}

extension StationModel {
    static var showItems = [
        StationModel(stationName: "Музыка для расслабления",
                     stationType: "Электронная медитация.", image: "relax"),
        StationModel(stationName: "Популярное",
                     stationType: "То, что слушают прямо сейчас", image: "popular"),
        StationModel(stationName: "Классика электронной музыки",
                     stationType: "Как рождался саунд будущего.", image: "classic"),
        StationModel(stationName: "Классика рока",
                     stationType: "Гении гитарного звука.", image: "rock"),
        StationModel(stationName: "Классика",
                     stationType: "Выдающиеся образцы жанра", image: "classic 2"),
        StationModel(stationName: "Хип-Хоп",
                     stationType: "Идеальные биты и рифмы.", image: "hip-hop")
    ]
}
