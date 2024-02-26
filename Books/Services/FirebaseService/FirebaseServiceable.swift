//
//  FirebaseServiceable.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import Foundation

protocol FirebaseServiceable {
    func getBooks() async throws -> BooksResponse
}
