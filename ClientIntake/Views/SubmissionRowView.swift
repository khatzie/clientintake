//
//  SubmissionRowView.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import SwiftUI

struct SubmissionRowView: View {

    let submission: Submission
    let isReviewed: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {

            HStack {
                Text(submission.name)
                    .font(.headline)

                Spacer()

                if isReviewed || submission.isReviewed{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                }
            }

            Text(submission.email)
                .font(.subheadline)

            if isReviewed || submission.isReviewed{
                Text("Reviewed")
                    .font(.caption)
            }else{
                Text(submission.status.displayName)
                    .font(.caption)
            }
            
        }
    }
}
