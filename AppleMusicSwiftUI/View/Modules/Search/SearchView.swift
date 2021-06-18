//
//  SearchView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 16.06.2021.
//

import UIKit
import SnapKit

class SearchView: UIViewController {

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Ваша Медиатека"
        return searchBar
    }()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        let flowLayout = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        collectionView.backgroundColor = .white
        return collectionView
    }()

    func setupView() {

        collectionView.backgroundColor = .white
    }

    func setupHierrarchy() {

        addSubview(searchBar)
        addSubview(collectionView)
    }

    func setupLayout() {

        searchBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
