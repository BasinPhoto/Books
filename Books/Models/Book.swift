//
//  Book.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import Foundation

struct Book: Codable, Identifiable {
    var id: Int
    var name: String
    var author: String
    var summary: String
    var genre: String
    var coverUrl: String
    var views: String
    var likes: String
    var quotes: String

    enum CodingKeys: String, CodingKey {
        case id, name, author, summary, genre, views, likes, quotes
        case coverUrl = "cover_url"
    }
}
