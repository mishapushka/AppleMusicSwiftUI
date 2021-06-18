//
//  SearchIntegration.swift
//  AppleMusicSwiftUI
//
//  Created by mac on 16.06.2021.
//

import SwiftUI
import UIKit

struct SomeView: UIViewControllerRepresentable {

  func makeUIViewController(context: Context) -> UIViewController {
      return SearchView()
  }

  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
      // можно оставить пустым
  }
}
