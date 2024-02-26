//
//  FirebaseService.swift
//  Books
//
//  Created by Sergey Basin on 26.02.2024.
//

import FirebaseRemoteConfig
import Foundation

final class FirebaseService: FirebaseServiceable {
    func getBooks() async throws -> BooksResponse {
        let remoteConfig = RemoteConfig.remoteConfig()
        let status = try await remoteConfig.fetch()
        
        guard status == .success else {
            throw FirebaseError.remoteConfigStatusError
        }
        
        try await remoteConfig.activate()
        
        guard let jsonString = remoteConfig["json_data"].stringValue,
              let jsonData = jsonString.data(using: .utf8) else {
            throw FirebaseError.invalidData
        }

        let booksResponse = try JSONDecoder().decode(BooksResponse.self, from: jsonData)
        return booksResponse
    }
}
