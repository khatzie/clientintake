//
//  SubmissionRepository.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/10/26.
//

import Foundation

protocol SubmissionRepositoryProtocol {
    func getSubmissions()
    async throws -> [Submission]
}

final class SubmissionRepository:
    SubmissionRepositoryProtocol {

    private let service:
        SubmissionServiceProtocol

    init(
        service: SubmissionServiceProtocol =
            SubmissionService()
    ) {
        self.service = service
    }

    func getSubmissions()
    async throws -> [Submission] {

        let rawSubmissions =
            try await service.fetchSubmissions()

        return rawSubmissions.map {
            Submission(raw: $0)
        }
    }
}
