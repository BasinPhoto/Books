//
//  LibraryView.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import SwiftData
import SwiftUI

struct LibraryView: View {
    @State var viewModel = LibraryViewModel()
    @State private var tabPageSelection = 0
    @State private var sortedByCategoryBooks = [String: [Book]]()
    
    private let bannerHeight: CGFloat = 160
    
    var body: some View {
        ScrollView {
            bannerSection
            
            ForEach(sortedByCategoryBooks.keys.sorted(), id: \.self) { category in
                if let books = sortedByCategoryBooks[category] {
                    GenreSectionView(category: category, books: books)
                }
            }
        }
        .scrollContentBackground(.visible)
        .background(.black)
        .task {
            await viewModel.getData()
            sortedByCategoryBooks = viewModel.getSortedByCategory()
        }
    }
    
    private var bannerSection: some View {
        Section {
            TabView(selection: $tabPageSelection) {
                ForEach(viewModel.banners) { banner in
                    AsyncImage(url: URL(string: banner.cover)) { image in
                        image
                            .resizable()
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .clipShape(.rect(cornerRadius: 16))
            .frame(height: bannerHeight)
        } header: {
            Text("Library")
                .foregroundStyle(.accent)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

#Preview {
    LibraryView()
}

import os

@Observable
final class LibraryViewModel {
    let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "", category: String(describing: LibraryViewModel.self))
    
    var books = [Book]()
    var banners = [Banner]()
    var youWillLikeNumbers = [Int]()
    var hasError = false
    
    @ObservationIgnored
    let dataService: FirebaseServiceable

    init(dataService: FirebaseServiceable = MockFirebaseService()) {
        self.dataService = dataService
    }
    
    func getData() async {
        do {
            let booksResponse = try await dataService.getBooks()
            books = booksResponse.books
            banners = booksResponse.topBannerSlides
            youWillLikeNumbers = booksResponse.youWillLikeSection
        } catch {
            logger.error("\(#function) Loading data failed: \(error)")
            hasError = true
        }
    }
    
    func getSortedByCategory() -> [String : [Book]]{
        let groupedBooksDict = books.reduce(into: [String: [Book]]()) { category, book in
            category[book.genre, default: []].append(book)
        }
        logger.debug("\(#function) Sorted \(self.books.count) books in \(groupedBooksDict.keys.count) categories")
        return groupedBooksDict
    }
}
