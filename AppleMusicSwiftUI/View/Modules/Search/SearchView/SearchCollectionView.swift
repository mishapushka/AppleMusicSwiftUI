//
//  SearchCollectionView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 16.06.2021.
//

import UIKit
import SnapKit

class SearchCollectionView: UIViewController {

    // MARK: - Category

    var category = SearchCategoryModel.items

    // MARK: - Views

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Ваша Медиатека"
        searchBar.delegate = self
        return searchBar
    }()

    // MARK: - CollectionView

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        let flowLayout = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        collectionView.backgroundColor = .white
        return collectionView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLayout()
        setupHierrarchy()
    }

    // MARK: - Settings

    private func setupView() {

        collectionView.backgroundColor = .white
    }

    private func setupHierrarchy() {

        view.addSubview(searchBar)
        view.addSubview(collectionView)
    }

    private func setupLayout() {

        searchBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

    // MARK: - UICollectionViewDataSource

extension SearchCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        category.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}

    // MARK: - UISearchBarDelegate

extension SearchCollectionView: UISearchBarDelegate {

}
