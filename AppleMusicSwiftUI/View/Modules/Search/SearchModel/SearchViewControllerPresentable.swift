//
//  SearchViewControllerPresentable.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 16.06.2021.
//

import SwiftUI
import UIKit

struct SearchViewControllerPresentable: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> UIViewController {
        return SearchCollectionView()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
