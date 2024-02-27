//
//  LibraryView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftUI

struct LibraryView: View {
    @Bindable var viewModel: LibraryViewModel
    @State private var sortedByCategoryBooks = [String: [Book]]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                BannersView(banners: viewModel.banners, books: viewModel.books)
                
                ForEach(sortedByCategoryBooks.keys.sorted(), id: \.self) { category in
                    if let books = sortedByCategoryBooks[category] {
                        BooksSectionView(sectionHeader: category, books: books)
                    }
                }
            }
            .navigationDestination(for: Book.self) { book in
                let selectedBookGenre = book.genre
                if let allGenreBooks = sortedByCategoryBooks[selectedBookGenre] {
                    BookDetailsView(
                        books: allGenreBooks,
                        selectedBook: book,
                        likeBooks: viewModel.likeBooks
                    )
                }
            }
            .task {
                await viewModel.getData()
                sortedByCategoryBooks = viewModel.getSortedByCategory()
            }
        }
    }
}

#Preview {
    LibraryView(viewModel: LibraryViewModel())
}
