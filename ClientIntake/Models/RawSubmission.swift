//
//  RawSubmission.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import Foundation

struct RawSubmission: Decodable {
    
    struct FlexibleID: Decodable {
        let value: String

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()

            if let intValue = try? container.decode(Int.self) {
                value = String(intValue)
                return
            }

            if let stringValue = try? container.decode(String.self) {
                value = stringValue
                return
            }

            throw DecodingError.typeMismatch(
                String.self,
                .init(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unable to decode ID"
                )
            )
        }
    }

    struct FlexibleString: Decodable {
        let value: String

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()

            if let stringValue = try? container.decode(String.self) {
                value = stringValue
                return
            }

            if let intValue = try? container.decode(Int.self) {
                value = String(intValue)
                return
            }

            value = ""
        }
    }

    struct FlexibleDate: Decodable {
        let rawValue: String

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()

            if let stringValue = try? container.decode(String.self) {
                rawValue = stringValue
                return
            }

            if let intValue = try? container.decode(Int.self) {
                rawValue = String(intValue)
                return
            }

            rawValue = ""
        }
    }

    let id: FlexibleID?
    let name: String?
    let email: String?
    let phone: FlexibleString?
    let service: String?
    let status: String?
    let message: String?
    let submittedAt: FlexibleDate?
    let formVersion: String?
}
