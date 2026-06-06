//
//  ReviewedStore.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import Foundation

final class ReviewedStore {

    private let key = "reviewed_submissions"

    func reviewedIDs() -> Set<String> {
        Set(
            UserDefaults.standard.stringArray(forKey: key) ?? []
        )
    }

    func markReviewed(id: String) {
        var ids = reviewedIDs()

        ids.insert(id)

        UserDefaults.standard.set(
            Array(ids),
            forKey: key
        )
    }
}
