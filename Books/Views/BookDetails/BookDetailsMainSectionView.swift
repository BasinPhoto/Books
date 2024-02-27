//
//  BookDetailsMainSectionView.swift
//  Books
//
//  Created by Sergey Basin on 27.02.2024.
//

import SwiftUI

struct BookDetailsMainSectionView: View {
    let book: Book
    
    var body: some View {
        VStack {
            Group {
                BookStatisticView(book: book)
                Divider()
                BookSummaryView(book: book)
                Divider()
            }
            .padding(.horizontal)
        }
        .background(alignment: .top) {
            Rectangle()
                .foregroundStyle(.background)
                .frame(height: 32)
                .cornerRadius(32)
                .offset(x: 0, y: -22)
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
            quotes: "23"
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
            quotes: "34"
        ),
        Book(
            id: 3,
            name: "Wind",
            author: "John Snow",
            summary: "Winter is coming",
            genre: "Romance",
            coverUrl: "https://unsplash.it/600/300",
            views: "5",
            likes: "3",
            quotes: "54"
        )
    ]
    return BookDetailsMainSectionView(book: books[0])
}
