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

    var categoryes = SearchCategoryModel.items

    // MARK: - Views

    private let titleLarge: UILabel = {
        var title = UILabel()
        title.text = "Поиск"
        title.font = UIFont.boldSystemFont(ofSize: 32.0)
        title.textAlignment = .left
        title.textColor = .black
        return title
    }()

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Ваша Медиатека"
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()

    private let separatorView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 1))
        view.backgroundColor = .lightGray
        view.center = view.center
        view.image = UIImage(named: "divider")
        return view
    }()

    // MARK: - CollectionView

    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        let flowLayout = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout.init()
        )
        collectionView.register(HeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.register(SearchCategoryCell.self,
                                forCellWithReuseIdentifier: SearchCategoryCell.identifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.reloadData()

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
        view.addSubview(titleLarge)
        view.addSubview(separatorView)
    }

    private func setupLayout() {

        titleLarge.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.bottom.equalTo(searchBar.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }

        searchBar.snp.makeConstraints {
            $0.top.equalTo(titleLarge.snp.bottom)
            $0.bottom.equalTo(separatorView.snp.top).inset(-5)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview().inset(-28)

        }

        separatorView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.bottom.equalTo(collectionView.snp.top).inset(-7)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview().inset(-50)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom)
            $0.bottom.equalToSuperview().inset(-65)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview().inset(-33)
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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: 12)

        return CGSize(width: width, height: 125)
    }

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow - 10

        return floor(finalWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 12)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return -3
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionReusableView.identifier,
            for: indexPath) as! HeaderCollectionReusableView
        header.configure()
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 30)
    }
}
