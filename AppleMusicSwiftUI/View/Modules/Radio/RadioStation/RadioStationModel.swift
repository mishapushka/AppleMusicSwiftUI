//
//  RadioStationModel.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 07.06.2021.
//

import Foundation

struct RadioStationModel: Identifiable, Hashable {
    var id = UUID().uuidString
    var stationType: String
    var musicType: String
    var slogan: String
    var image: String
}

extension RadioStationModel {
    static var stationItems = [
        RadioStationModel(stationType: "Новый выпуск", musicType: "Музыкальный базар с Бастой",
                          slogan: "Новое шоу", image: "radio station basta"),
        RadioStationModel(stationType: "Избранная радиостанция", musicType: "Популярное",
                          slogan: "То, что слушают прямо сейчас.", image: "radio station populary"),
        RadioStationModel(stationType: "Избранная радиостанция", musicType: "ХИП-ХОП",
                          slogan: "Идеальные биты и рифмы.", image: "radio station hip-hop"),
        RadioStationModel(stationType: "Избранная радиостанция", musicType: "Только поп-музыка",
                          slogan: "Все топ-хиты", image: "radio station top pop"),
        RadioStationModel(stationType: "Избранная радиостанция", musicType: "Поп-музыка для тренировок",
                          slogan: "Вперед и с музыкой!", image: "radio station sport pop"),
        RadioStationModel(stationType: "Избранная радиостанция", musicType: "Эдектронная музыка",
                          slogan: "Пульт с лучшими треками.", image: "radio station electro"),
        RadioStationModel(stationType: "Новая радиостанция", musicType: "Классика рока",
                          slogan: "Гении гитарного звука.", image: "radio station guitars"),
        RadioStationModel(stationType: "Избранная радиостанция", musicType: "Танцевальная музыка",
                          slogan: "Современные и будущие хиты.", image: "radio station dance")
    ]
}
