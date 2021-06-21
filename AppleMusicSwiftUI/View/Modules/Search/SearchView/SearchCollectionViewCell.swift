//
//  SearchCollectionViewCell.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 21.06.2021.
//

import UIKit
import Foundation

class SearchCollectionViewCell: UICollectionViewCell {

    lazy var categoryImageView: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    lazy var categoryLabelName: UILabel = {
        var labelName = UILabel(frame: .zero)
        labelName.textAlignment = .left
        labelName.textColor = .white
        labelName.font = UIFont.boldSystemFont(ofSize: 15)
        return labelName
    }()

}
