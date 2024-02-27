//
//  LibraryViewModel.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import Foundation
import SwiftData
import os

@Observable
final class LibraryViewModel {
    let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier ?? "",
        category: String(describing: LibraryViewModel.self)
    )
    
    var books = [Book]()
    var banners = [Banner]()
    var youWillLikeNumbers = [Int]()
    var hasError = false
    
    var likeBooks: [Book] {
        books.filter { youWillLikeNumbers.contains($0.id) }
    }
    
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
