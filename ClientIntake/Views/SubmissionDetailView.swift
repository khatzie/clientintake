//
//  SubmissionDetailView.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import SwiftUI

struct SubmissionDetailView: View {

    let submission: Submission
//    let isReviewed: Bool
//    private let reviewedStore = ReviewedStore()
    
    @ObservedObject var viewModel: SubmissionListViewModel

    var body: some View {
        List {
            Section("Contact") {
                Text(submission.name)
                Text(submission.email)
                Text(submission.phone)
            }

            Section("Service") {
                Text(submission.service)
                Text(!viewModel.reviewedIDs.contains(submission.id) ? submission.status.displayName :  "Reviewed")
            }

            Section("Message") {
                Text(submission.message)
            }
            
            Section("Date Submitted") {
                if let submittedDate = submission.submittedDate {
                    Text(
                        submittedDate.formatted(
                            date: .abbreviated,
                            time: .shortened
                        )
                    )
                } else {
                    Text("Not Available")
                        .foregroundStyle(.secondary)
                }
            }
            
            if !viewModel.reviewedIDs.contains(submission.id) {
                Button("Mark as Reviewed") {
                    viewModel.markReviewed(submission)
                }
            }
            
        }
        .navigationTitle("Details")
    }
}
