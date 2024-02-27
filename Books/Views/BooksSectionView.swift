//
//  BooksSectionView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftUI

struct BooksSectionView: View {
    let sectionHeader: String
    let books: [Book]
    
    var body: some View {
        VStack {
            Text(sectionHeader)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(books) { book in
                        NavigationLink(value: book) {
                            VStack(alignment: .leading) {
                                BookCoverView(book: book)
                                    .frame(height: 150)
                                    .clipped()
                                    .cornerRadius(16)
                                Group {
                                    Text(book.author)
                                        .font(.caption)
                                        .bold()
                                    
                                    Text(book.name)
                                        .font(.caption2)
                                }
                                .lineLimit(1)
                                .padding(.horizontal)
                            }
                            .frame(width: 120)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .safeAreaPadding(.horizontal)
            .padding(.bottom)
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
            summary: "Winter is coming",
            genre: "Romance",
            coverUrl: "https://unsplash.it/600/300",
            views: "5",
            likes: "3",
            quotes: "qqq"
        )
    ]
    
    return BooksSectionView(sectionHeader: books.first?.genre ?? "NO_GENRE", books: books)
}
