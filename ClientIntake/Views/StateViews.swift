//
//  StateViews.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading submissions...")
    }
}

struct EmptyStateView: View {
    var body: some View {
        ContentUnavailableView(
            "No Submissions",
            systemImage: "tray"
        )
    }
}

struct ErrorStateView: View {
    let message: String

    var body: some View {
        ContentUnavailableView(
            "Something went wrong",
            systemImage: "exclamationmark.triangle",
            description: Text(message)
        )
    }
}
