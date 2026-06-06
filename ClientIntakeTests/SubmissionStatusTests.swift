//
//  SubmissionStatusTests.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/7/26.
//

import XCTest
@testable import ClientIntake

final class SubmissionStatusTests: XCTestCase {

    func testOpenStatusNormalization() {
        XCTAssertEqual(
            SubmissionStatus(rawValue: "OPEN"),
            .open
        )

        XCTAssertEqual(
            SubmissionStatus(rawValue: "Open"),
            .open
        )

        XCTAssertEqual(
            SubmissionStatus(rawValue: "open"),
            .open
        )

        XCTAssertEqual(
            SubmissionStatus(rawValue: "OPEN "),
            .open
        )
    }

    func testInReviewStatusNormalization() {
        XCTAssertEqual(
            SubmissionStatus(rawValue: "in review"),
            .inReview
        )

        XCTAssertEqual(
            SubmissionStatus(rawValue: "in_review"),
            .inReview
        )
    }

    func testUnknownStatusNormalization() {
        XCTAssertEqual(
            SubmissionStatus(rawValue: "unknown_status"),
            .unknown
        )

        XCTAssertEqual(
            SubmissionStatus(rawValue: ""),
            .unknown
        )
    }
}
