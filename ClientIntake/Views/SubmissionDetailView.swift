//
//  SubmissionDetailView.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import SwiftUI

struct SubmissionDetailView: View {

    let submission: Submission
    let isReviewed: Bool
    private let reviewedStore = ReviewedStore()

    var body: some View {
        List {
            Section("Contact") {
                Text(submission.name)
                Text(submission.email)
                Text(submission.phone)
            }

            Section("Service") {
                Text(submission.service)
                Text(submission.status.displayName)
            }

            Section("Message") {
                Text(submission.message)
            }
            
            if !isReviewed {
                Button("Mark as Reviewed") {
                    reviewedStore.markReviewed(
                        id: submission.id
                    )
                }
            }
            
        }
        .navigationTitle("Details")
    }
}
