//
//  BookDetailsHeader.swift
//  Books
//
//  Created by Sergey Basin on 27.02.2024.
//

import SwiftUI

struct BookDetailsHeader: View {
    @Environment(\.dismiss) private var dismiss
    
    let books: [Book]
    
    @Binding var scrollPositionBook: Book?
    
    private let coversSpacing: CGFloat = 20
    private let coverCornerRadius: CGFloat = 16
    private let coverSectionHeight: CGFloat = 350
    private let contentMargin: CGFloat = 100
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                        .bold()
                        .foregroundStyle(.white)
                }
                
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: coversSpacing) {
                    ForEach(books) { book in
                        VStack {
                            BookCoverView(book: book)
                                .containerRelativeFrame(.horizontal)
                                .clipShape(.rect(cornerRadius: coverCornerRadius))
                            Group {
                                Text(book.author)
                                    .font(.headline)
                                    .bold()
                                
                                Text(book.name)
                                    .font(.subheadline)
                            }
                            .lineLimit(1)
                            .foregroundStyle(.white)
                        }
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(phase.isIdentity ? 1 : 0.75)
                        }
                        .id(book)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $scrollPositionBook)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(.horizontal, contentMargin, for: .scrollContent)
        }
        .frame(height: coverSectionHeight)
        .padding(.vertical)
        .background {
            Image(.carouselBackground)
                .resizable()
                .scaledToFill()
                .overlay {
                    Color.carouselBackground.blendMode(.multiply)
                }
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
    
    return BookDetailsHeader(books: books, scrollPositionBook: .constant(books[0]))
}
