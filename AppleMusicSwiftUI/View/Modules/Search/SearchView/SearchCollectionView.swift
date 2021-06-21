//
//  SearchCollectionView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 16.06.2021.
//

import UIKit
import SnapKit

class SearchCollectionView: UIViewController, UISearchBarDelegate {

    // MARK: - Category

    var categoryes = SearchCategoryModel.items

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
        collectionView.register(HeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.register(SearchCategoryCell.self,
                                forCellWithReuseIdentifier: SearchCategoryCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
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
        categoryes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchCategoryCell.identifier,
            for: indexPath) as! SearchCategoryCell
        let category = categoryes[indexPath.row]
        cell.setup(with: category)
        return cell
    }
}

    // MARK: - UICollectionViewDelegateFlowLayout

extension SearchCollectionView: UICollectionViewDelegateFlowLayout {

}
