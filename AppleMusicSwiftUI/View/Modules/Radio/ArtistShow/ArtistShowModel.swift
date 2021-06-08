//
//  ArtistShowModel.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 07.06.2021.
//

import Foundation

struct ArtistShowModel: Identifiable, Hashable {
    var id = UUID()
    var showType: String
    var artistName: String?
    var image: String
}

extension ArtistShowModel {
    static var showItems = [
        ArtistShowModel(showType: "Музыкальный базар с Бастой",
                        artistName: "Новое шоу", image: "artist basta"),
        ArtistShowModel(showType: "Rocket Hour",
                        artistName: "Элтон Джон", image: "artist elton jhon"),
        ArtistShowModel(showType: "Boiler Room",
                        artistName: "Apple Music", image: "artist boiler room"),
        ArtistShowModel(showType: "me & dad radio",
                        artistName: "Billi Eillish", image: "artist billie eilish"),
        ArtistShowModel(showType: "GAGA RADIO",
                        artistName: "Lady Gaga", image: "artist gaga"),
        ArtistShowModel(showType: "blonded RADIO",
                        artistName: "Frank Okean", image: "artist frank ocean"),
        ArtistShowModel(showType: "Loud and Sad radio with Pete Wentz",
                        artistName: nil, image: "artist wentz"),
        ArtistShowModel(showType: "HAIM TIME",
                        artistName: "HAIM", image: "artist haim"),
        ArtistShowModel(showType: "SOULECTION",
                        artistName: "Джо Кей", image: "artist jo key"),
        ArtistShowModel(showType: "Song Machine Radio with Gorillaz",
                        artistName: nil, image: "artist song machine"),
        ArtistShowModel(showType: "The Alligator Hour",
                        artistName: "Джошуа Хомме", image: "artist joshua"),
        ArtistShowModel(showType: "Time Crisis",
                        artistName: "Эзра Кениг", image: "artist kenig"),
        ArtistShowModel(showType: "One Mix",
                        artistName: "Разные артисты", image: "artist one mix"),
        ArtistShowModel(showType: "FeelMyBicepRadio",
                        artistName: nil, image: "artist feel bicep"),
        ArtistShowModel(showType: "Live from the Moon",
                        artistName: "Action Bronson", image: "artist bronson"),
        ArtistShowModel(showType: "The Echo Chamber",
                        artistName: "Mike D", image: "artist mike d"),
        ArtistShowModel(showType: "It's Electric!",
                        artistName: "Ларс Ульрих", image: "artist lars"),
        ArtistShowModel(showType: "St. Vincent Mixtep Delivery Service",
                        artistName: "St. Vincent", image: "artist vincent"),
        ArtistShowModel(showType: "mau5trap presents...",
                        artistName: "deadmau5", image: "artist deadmau"),
        ArtistShowModel(showType: "The Candy Shop",
                        artistName: "Charli XCX", image: "artist charil")
    ]
}
