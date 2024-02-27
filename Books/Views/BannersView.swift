//
//  BannersView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftUI

struct BannersView: View {
    let banners: [Banner]
    let books: [Book]
    
    @State private var selectedBannerIndex = 0
    @State private var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Library")
                .foregroundStyle(.accent)
                .bold()
                .padding(.bottom)
            
            TabView(selection: $selectedBannerIndex) {
                ForEach(banners.indices, id:\.self) { bannerIndex in
                    NavigationLink(value: books.first(where: { $0.id == banners[bannerIndex].bookId })) {
                        let banner = banners[bannerIndex]
                        AsyncImage(url: URL(string: banner.cover)) { image in
                            image
                                .resizable()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .tag(bannerIndex)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .aspectRatio(21/9, contentMode: .fill)
            .clipShape(.rect(cornerRadius: 16))
        }
        .padding()
        .onReceive(timer) { _ in
            autoScrollBanner()
        }
    }
    
    private func autoScrollBanner() {
        // Check if the last banner selected
        guard (selectedBannerIndex + 1) < banners.count else {
            withAnimation {
                selectedBannerIndex = 0
            }
            return
        }
        
        withAnimation {
            selectedBannerIndex += 1
        }
    }
}

#Preview {
    let banners = [
        Banner(id: 1, bookId: 1, cover: "https://unsplash.it/600/300"),
        Banner(id: 2, bookId: 2, cover: "https://unsplash.it/600/300"),
        Banner(id: 3, bookId: 3, cover: "https://unsplash.it/600/300")
    ]
    
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
    
    return BannersView(banners: banners, books: books)
}
