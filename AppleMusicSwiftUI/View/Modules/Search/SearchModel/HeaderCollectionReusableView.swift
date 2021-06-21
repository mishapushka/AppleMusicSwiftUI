//
//  HeaderCollectionReusableView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 21.06.2021.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"

    private let label: UILabel = {
        var label = UILabel()
        label.text = "Поиск по категориям"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.backgroundColor = .black
        label.textAlignment = .left
        return label
    }()

    public func setupHierrarchy() {

        addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
