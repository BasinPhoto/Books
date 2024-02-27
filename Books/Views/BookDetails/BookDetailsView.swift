//
//  BookDetailsView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftUI

struct BookDetailsView: View {
    let books: [Book]
    let selectedBook: Book
    let likeBooks: [Book]
    
    @State private var scrollPositionBook: Book?
    
    var body: some View {
        ScrollView {
            BookDetailsHeader(books: books, scrollPositionBook: $scrollPositionBook)
            
            if let scrollPositionBook {
                BookDetailsMainSectionView(book: scrollPositionBook)
            }
            
            if likeBooks.isEmpty == false {
                BooksSectionView(
                    sectionHeader: "You will also like",
                    books: likeBooks
                )
                .ignoresSafeArea()
            }
            
            Button(action: {}, label: {
                Text("Read Now")
                    .fontWeight(.bold)
                    .frame(maxWidth: 278)
                    .padding()
                    .background(.accent)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    .padding(.horizontal)
            })
        }
        .task {
            scrollPositionBook = selectedBook
        }
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea(.container, edges: .top)
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
    
    return BookDetailsView(
        books: books,
        selectedBook: books[1],
        likeBooks: [books[1], books[2]]
    )
}
