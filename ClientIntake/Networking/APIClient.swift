//
//  APIClient.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/10/26.
//

import Foundation

protocol APIClientProtocol {
    func fetch<T: Decodable>(
        from url: URL
    ) async throws -> T
}

final class APIClient: APIClientProtocol {

    func fetch<T: Decodable>(
        from url: URL
    ) async throws -> T {

        let (data, response) = try await URLSession.shared.data(
            from: url
        )

        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }

        return try JSONDecoder().decode(
            T.self,
            from: data
        )
    }
}
