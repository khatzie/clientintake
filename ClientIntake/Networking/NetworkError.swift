//
//  NetworkError.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/10/26.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingFailed

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"

        case .invalidResponse:
            return "Invalid server response"

        case .decodingFailed:
            return "Unable to decode response"
        }
    }
}
