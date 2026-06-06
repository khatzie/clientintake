//
//  DateParser.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import Foundation

enum DateParser {

    static func parse(_ value: String?) -> Date? {
        guard let value, !value.isEmpty else {
            return nil
        }

        // Unix timestamp string
        if let timestamp = TimeInterval(value) {
            return Date(timeIntervalSince1970: timestamp)
        }

        // ISO8601
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: value) {
            return date
        }

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")

        let formats = [
            "yyyy/MM/dd",
            "yyyy-MM-dd",
            "MMM d, yyyy",
            "dd-MM-yyyy"
        ]

        for format in formats {
            formatter.dateFormat = format

            if let date = formatter.date(from: value) {
                return date
            }
        }

        return nil
    }
}
