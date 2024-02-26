//
//  BooksApp.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import Firebase
import SwiftUI

@main
struct BooksApp: App {
    init() {
        FirebaseApp.configure()
        setupAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func setupAppearance() {
      UIPageControl.appearance().currentPageIndicatorTintColor = .accent
      UIPageControl.appearance().pageIndicatorTintColor = UIColor.accent.withAlphaComponent(0.3)
    }
}
