//
//  SearchView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 16.06.2021.
//

import UIKit

class SearchView: UICollectionView {

    lazy var searchBar = UISearchBar()

    lazy var collectionView = UICollectionView()

    func setupHierrarchy() {
        addSubview(searchBar)
        addSubview(collectionView)
    }

    func setupLayout() {
        
    }
}
