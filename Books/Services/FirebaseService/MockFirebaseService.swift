//
//  MockFirebaseService.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import Foundation

final class MockFirebaseService: FirebaseServiceable {
    let mockResponseFilename = "mock_book_response"
    
    func getBooks() async throws -> BooksResponse {
        let response = try decodeCatalog()
        return response
    }
    
    private func decodeCatalog() throws -> BooksResponse {
        guard let url = Bundle.main.url(forResource: mockResponseFilename, withExtension: "json") else {
            throw CocoaError(.fileNoSuchFile, userInfo: [:])
        }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let booksResponse = try decoder.decode(BooksResponse.self, from: data)
        return booksResponse
    }
}
