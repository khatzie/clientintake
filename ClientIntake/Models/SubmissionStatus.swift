//
//  SubmissionStatus.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import Foundation

enum SubmissionStatus: String {
    case new
    case open
    case pending
    case inReview
    case reviewed
    case closed
    case unknown

    init(rawValue: String) {
        switch rawValue
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased() {

        case "new":
            self = .new

        case "open":
            self = .open

        case "pending":
            self = .pending

        case "in review", "in_review":
            self = .inReview

        case "reviewed":
            self = .reviewed

        case "closed":
            self = .closed

        default:
            self = .unknown
        }
    }

    var displayName: String {
        switch self {
        case .new:
            return "New"
        case .open:
            return "Open"
        case .pending:
            return "Pending"
        case .inReview:
            return "In Review"
        case .reviewed:
            return "Reviewed"
        case .closed:
            return "Closed"
        case .unknown:
            return "Unknown"
        }
    }
}
