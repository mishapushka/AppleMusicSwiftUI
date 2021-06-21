//
//  CategoryProfile.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 21.06.2021.
//

import Foundation

struct CategoryProfile {
    var name: String
    var imageName: String
}

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}
