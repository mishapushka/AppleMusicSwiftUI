//
//  SearchCollectionView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 16.06.2021.
//

import UIKit

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

        setupHierrarchy()
        setupView()
        setupLayout()
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

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        titleLarge.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLarge.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLarge.bottomAnchor.constraint(equalTo: searchBar.topAnchor),
            titleLarge.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            titleLarge.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),
            titleLarge.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: titleLarge.bottomAnchor),
            searchBar.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -5),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 14),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -14),
            searchBar.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -28)
        ])
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            separatorView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -7),
            separatorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            separatorView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),
            separatorView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50)
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -65),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -33)
        ])
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
