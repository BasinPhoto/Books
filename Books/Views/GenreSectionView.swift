//
//  GenreSectionView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftUI

struct GenreSectionView: View {
    let category: String
    let books: [Book]
    
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(books) { book in
                        BookCardView(book: book)
                    }
                }
            }
            .safeAreaPadding(.horizontal)
        } header: {
            Text(category)
                .bold()
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
    }
}

#Preview {
    let books = [
        Book(
            id: 1,
            name: "Run Forest",
            author: "Tom Hanks",
            summary: "My best book",
            genre: "Romance",
            coverUrl: "https://unsplash.it/600/300",
            views: "5",
            likes: "3",
            quotes: "qqq"
        ),
        Book(
            id: 2,
            name: "Wind",
            author: "John Snow",
            summary: "Winter is comming",
            genre: "Romance",
            coverUrl: "https://unsplash.it/600/300",
            views: "5",
            likes: "3",
            quotes: "qqq"
        )
    ]
    
    return GenreSectionView(category: books.first?.genre ?? "NO_GENRE", books: books)
}
