//
//  ContentView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoaded = false
    
    var body: some View {
        Group {
            if isLoaded {
                LibraryView()
            } else {
                SplashScreenView(isLoaded: $isLoaded)
            }
        }
    }
}

#Preview {
    ContentView()
}
