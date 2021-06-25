//
//  SearchCollectionView.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 16.06.2021.
//

import UIKit

class SearchCollectionView: UIViewController {

    // MARK: - Category

    var categories = SearchCategoryModel.items

    // MARK: - Views

    private let largeTitle: UILabel = {
        var title = UILabel()
        title.text = "Поиск"
        title.font = UIFont.boldSystemFont(ofSize: Views.titleLargeFont)
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
        let view = UIImageView(frame: CGRect(
            x: Views.viewFrameX,
            y: Views.viewFrameY,
            width: Views.viewFrameWidth,
            height: Views.viewFrameHeight
        ))
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
        view.addSubview(largeTitle)
        view.addSubview(separatorView)
    }

    private func setupLayout() {

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        largeTitle.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            largeTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                            constant: Metric.titleLargeTop),
            largeTitle.bottomAnchor.constraint(equalTo: searchBar.topAnchor),
            largeTitle.leftAnchor.constraint(equalTo: view.leftAnchor,
                                             constant: Metric.titleLargeLeft),
            largeTitle.rightAnchor.constraint(equalTo: view.rightAnchor,
                                              constant: Metric.titleLargeRight),
            largeTitle.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: largeTitle.bottomAnchor),
            searchBar.bottomAnchor.constraint(equalTo: separatorView.topAnchor,
                                              constant: Metric.searchBarBottom),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor,
                                            constant: Metric.searchBarLeft),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor,
                                             constant: Metric.searchBarRight),
            searchBar.widthAnchor.constraint(equalTo: view.widthAnchor,
                                             constant: Metric.searchBarWidth)
        ])
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            separatorView.bottomAnchor.constraint(equalTo: collectionView.topAnchor,
                                                  constant: Metric.separatorViewBottom),
            separatorView.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                constant: Metric.separatorViewLeft),
            separatorView.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                 constant: Metric.separatorViewRight),
            separatorView.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                 constant: Metric.separatorViewWidth)
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                   constant: Metric.collectionViewBottom),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                 constant: Metric.collectionViewLeft),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                  constant: Metric.collectionViewRight),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                  constant: Metric.collectionViewWidth)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension SearchCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchCategoryCell.identifier,
                for: indexPath) as? SearchCategoryCell else { return UICollectionViewCell() }
        let category = categories[indexPath.row]
        cell.setup(with: category)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SearchCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = itemWidth(for: view.frame.width, spacing: Value.widthSpacing)

        return CGSize(width: width, height: Value.widthHeight)
    }

    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = Value.itemWidthRow
        let totalSpacing: CGFloat = Value.totalSpacing * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow - Value.finalWidth

        return floor(finalWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: Value.edgeInsetsTop,
            left: Value.edgeInsetsLeft,
            bottom: Value.edgeInsetsBottom,
            right: Value.edgeInsetsRight
        )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Value.minimumLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Value.minimumInteritemSpacing
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
        return CGSize(width: view.frame.size.width, height: Value.referenceSizeHight)
    }
}

// MARK: - Metrics

extension SearchCollectionView {
    
    enum Views {
        static let titleLargeFont: CGFloat = 32
        static let viewFrameX: CGFloat = 0
        static let viewFrameY: CGFloat = 0
        static let viewFrameWidth: CGFloat = 500
        static let viewFrameHeight: CGFloat = 1
    }

    enum Metric {
        static let titleLargeTop: CGFloat = 50
        static let titleLargeLeft: CGFloat = 23
        static let titleLargeRight: CGFloat = -23

        static let searchBarBottom: CGFloat = -5
        static let searchBarLeft: CGFloat = 14
        static let searchBarRight: CGFloat = -14
        static let searchBarWidth: CGFloat = -32

        static let separatorViewBottom: CGFloat = -7
        static let separatorViewLeft: CGFloat = 23
        static let separatorViewRight: CGFloat = -23
        static let separatorViewWidth: CGFloat = -50

        static let collectionViewBottom: CGFloat = -65
        static let collectionViewLeft: CGFloat = 23
        static let collectionViewRight: CGFloat = -23
        static let collectionViewWidth: CGFloat = -33
    }

    enum Value {
        static let widthSpacing: CGFloat = 14
        static let widthHeight: CGFloat = 110

        static let itemWidthRow: CGFloat = 2
        static let totalSpacing: CGFloat = 2
        static let finalWidth: CGFloat = 10

        static let edgeInsetsTop: CGFloat = 14
        static let edgeInsetsLeft: CGFloat = 0
        static let edgeInsetsBottom: CGFloat = 14
        static let edgeInsetsRight: CGFloat = 14

        static let minimumLineSpacing: CGFloat = 14
        static let minimumInteritemSpacing: CGFloat = 14

        static let referenceSizeHight: CGFloat = 30
    }
}
