//
//  ContentView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = LibraryViewModel()
    
    @State private var isLoaded = false
    
    var body: some View {
        Group {
            if isLoaded {
                LibraryView(viewModel: viewModel)
            } else {
                SplashScreenView(isLoaded: $isLoaded)
            }
        }
    }
}

#Preview {
    ContentView()
}
