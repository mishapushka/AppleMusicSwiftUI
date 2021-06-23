//
//  SearchCategoryCell.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 21.06.2021.
//

import UIKit
import Foundation

class SearchCategoryCell: UICollectionViewCell {

    lazy var categoryImageView: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metric.layerImageView
        return imageView
    }()

    lazy var categoryLabelName: UILabel = {
        var labelName = UILabel(frame: .zero)
        labelName.textAlignment = .left
        labelName.textColor = .white
        labelName.font = UIFont.boldSystemFont(ofSize: Metric.fontLabelName)
        return labelName
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupHierrarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierrarchy() {

        contentView.backgroundColor = .white
        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryLabelName)
    }

    private func setupLayout() {
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryLabelName.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImageView.heightAnchor.constraint(equalToConstant: Metric.heightImageView)
        ])

        NSLayoutConstraint.activate([
            categoryLabelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.leadingLabelName),
            categoryLabelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Metric.trailingLabelName),
            categoryLabelName.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: Metric.topLabelName)
        ])
    }

    func setup(with profile: SearchCategoryModel) {
        categoryImageView.image = UIImage(named: profile.image)
        categoryLabelName.text = profile.text
    }
}

extension SearchCategoryCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension SearchCategoryCell {

    enum Metric {
        static let heightImageView: CGFloat = 150
        static let leadingLabelName: CGFloat = 16
        static let trailingLabelName: CGFloat = -16
        static let topLabelName: CGFloat = -30

        static let fontLabelName: CGFloat = 15
        static let layerImageView: CGFloat = 8
    }
}
