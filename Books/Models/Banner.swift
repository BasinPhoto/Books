//
//  Banner.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import Foundation

struct Banner: Codable, Identifiable {
    var id: Int
    var bookId: Int
    var cover: String

    enum CodingKeys: String, CodingKey {
        case id, cover
        case bookId = "book_id"
    }
}
