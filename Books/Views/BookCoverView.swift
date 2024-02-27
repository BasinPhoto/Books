//
//  BookCoverView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftUI

struct BookCoverView: View {
    let book: Book
    
    var body: some View {
        AsyncImage(url: URL(string: book.coverUrl)) { image in
            image
                .resizable()
        } placeholder: {
            Rectangle()
                .tint(.gray)
                .overlay {
                    ProgressView()
                }
        }
        .scaledToFill()
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
        quotes: "qqq"
    )
    
    return BookCoverView(book: book)
}
