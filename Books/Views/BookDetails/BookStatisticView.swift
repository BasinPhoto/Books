//
//  BookStatisticView.swift
//  Books
//
//  Created by Sergey Basin on 27.02.2024.
//

import SwiftUI

struct BookStatisticView: View {
    let book: Book
    
    var body: some View {
        HStack {
            Group {
                VStack {
                    Text(book.views)
                        .bold()
                    Text("Readers")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                VStack {
                    Text(book.likes)
                        .bold()
                    Text("Likes")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                VStack {
                    Text(book.quotes)
                        .bold()
                    Text("Quotes")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                VStack {
                    Text(book.genre)
                        .bold()
                    Text("Genre")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .lineLimit(1)
            .frame(maxWidth: .infinity)
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
            quotes: "23"
        )
        
    return BookStatisticView(book: book)
}
