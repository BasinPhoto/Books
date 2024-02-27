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
            Rectangle()
                .aspectRatio(0.7, contentMode: .fit)
                .overlay {
                    image
                        .resizable()
                        .scaledToFill()
                }
            
        } placeholder: {
            Rectangle()
                .aspectRatio(0.7, contentMode: .fit)
                .tint(.gray)
                .overlay {
                    ProgressView()
                }
        }
        .clipShape(.rect(cornerRadius: 16))
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
