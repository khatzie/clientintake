//
//  Submission.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import Foundation

struct Submission: Identifiable {
    let id: String
    let name: String
    let email: String
    let phone: String
    let service: String
    let status: SubmissionStatus
    let message: String
    let submittedDate: Date?
    let formVersion: String?
    
    init(raw: RawSubmission) {
        self.id = raw.id?.value.trimmingCharacters(in: .whitespacesAndNewlines)
            .nonEmpty ?? UUID().uuidString

        self.name = raw.name?
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .nonEmpty ?? "Unknown Applicant"

        self.email = raw.email?
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
            .nonEmpty ?? "No Email"

        self.phone = raw.phone?.value
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .nonEmpty ?? "No Phone"

        self.service = raw.service?
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .nonEmpty ?? "Unspecified"

        self.status = SubmissionStatus(rawValue: raw.status ?? "")

        self.message = raw.message?
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .nonEmpty ?? "No message provided"

        self.submittedDate = DateParser.parse(
            raw.submittedAt?.rawValue
        )

        self.formVersion = raw.formVersion
    }
}
