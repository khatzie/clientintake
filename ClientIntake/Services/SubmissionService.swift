//
//  SubmissionService.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/10/26.
//

import Foundation

protocol SubmissionServiceProtocol {
    func fetchSubmissions() async throws -> [RawSubmission]
}

final class SubmissionService:
    SubmissionServiceProtocol {

    private let apiClient: APIClientProtocol

    init(
        apiClient: APIClientProtocol = APIClient()
    ) {
        self.apiClient = apiClient
    }

    func fetchSubmissions() async throws -> [RawSubmission] {

        try await apiClient.fetch(
            from: Endpoint.submissions
        )
    }
}
