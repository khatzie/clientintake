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

    let title: String
    let systemImage: String
    let description: String?

    var body: some View {
        ContentUnavailableView(
            title,
            systemImage: systemImage,
            description: description.map { Text($0) }
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
