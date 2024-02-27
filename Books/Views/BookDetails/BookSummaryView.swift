//
//  BookSummaryView.swift
//  Books
//
//  Created by Sergey Basin on 27.02.2024.
//

import SwiftUI

struct BookSummaryView: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Summary")
                .font(.headline)
                .padding(.bottom, 8)
            Text(book.summary)
                .font(.callout)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let book = Book(
            id: 1,
            name: "Run Forest",
            author: "Tom Hanks",
            summary: "My best book",
            genre: "Romance",
            coverUrl: "https://unsplash.it/600/300",
            views: "5",
            likes: "3",
            quotes: "23"
        )
    
    return BookSummaryView(book: book)
}
