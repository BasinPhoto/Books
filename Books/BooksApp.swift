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
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
