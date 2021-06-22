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

        setupLayout()
        setupHierrarchy()
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
        
        categoryImageView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalToSuperview().inset(Metric.heightImageView)
        }

        categoryLabelName.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(Metric.leadingLabelName)
            $0.trailing.equalToSuperview().inset(Metric.trailingLabelName)
            $0.top.equalTo(categoryImageView.snp.bottom).inset(Metric.topLabelName)
        }
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
