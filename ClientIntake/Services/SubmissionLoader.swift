//
//  SubmissionLoader.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import Foundation

enum LoaderError: LocalizedError {
    case fileNotFound

    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "submissions.json could not be found in the app bundle."
        }
    }
}

final class SubmissionLoader {
    func load() throws -> [RawSubmission] {
        guard let url = Bundle.main.url(
            forResource: "submissions",
            withExtension: "json"
        ) else {
            throw LoaderError.fileNotFound
        }

        let data = try Data(contentsOf: url)

        return try JSONDecoder().decode(
            [RawSubmission].self,
            from: data
        )
    }
}
