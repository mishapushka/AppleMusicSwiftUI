//
//  SearchCategoryModel.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 16.06.2021.
//

import Foundation

struct SearchCategoryModel {
    var text: String
    var image: String
}

extension SearchCategoryModel {
    static var items = [
        SearchCategoryModel(text: "Хорошее настроение", image: "good"),
        SearchCategoryModel(text: "Спокойствие", image: "spoki"),
        SearchCategoryModel(text: "Хиты", image: "hits"),
        SearchCategoryModel(text: "Хип-Хоп", image: "hip-hop-1"),
        SearchCategoryModel(text: "Поп", image: "pop-1"),
        SearchCategoryModel(text: "Чарты", image: "charts"),
        SearchCategoryModel(text: "Нигга", image: "nigga"),
        SearchCategoryModel(text: "Безмятежность", image: "bezmetejnost"),
        SearchCategoryModel(text: "Спорт", image: "sport"),
        SearchCategoryModel(text: "Мотивация", image: "motivation")
    ]
}
