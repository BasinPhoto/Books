//
//  BooksResponse.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import Foundation

struct BooksResponse: Codable {
    var books: [Book]
    var topBannerSlides: [Banner]
    var youWillLikeSection: [Int]

    enum CodingKeys: String, CodingKey {
        case books
        case topBannerSlides = "top_banner_slides"
        case youWillLikeSection = "you_will_like_section"
    }
}
