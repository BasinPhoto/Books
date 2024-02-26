//
//  BookCardView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftUI

struct BookCardView: View {
    let book: Book
    
    private let cardWidth: CGFloat = 120
    private let cardHeight: CGFloat = 150
    private let cardCornerRadius: CGFloat = 16
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: book.coverUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: cardWidth, height: cardHeight)
                    .clipShape(.rect(cornerRadius: cardCornerRadius))
            } placeholder: {
                Rectangle()
                    .tint(.gray)
                    .frame(width: cardWidth, height: cardHeight)
                    .clipShape(.rect(cornerRadius: cardCornerRadius))
                    .overlay {
                        ProgressView()
                    }
            }

            Group {
                Text(book.author)
                    .font(.caption)
                    .bold()
                
                Text(book.name)
                    .font(.caption2)
            }
            .lineLimit(1)
        }
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
    
    return BookCardView(book: book)
}
