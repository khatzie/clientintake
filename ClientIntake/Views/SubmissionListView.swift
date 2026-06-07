//
//  SubmissionListView.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import SwiftUI

struct SubmissionListView: View {
    
    @StateObject private var viewModel = SubmissionListViewModel()
    
    var body: some View {
        NavigationStack {
            
            Group {
                switch viewModel.state {
                    
                case .loading:
                    LoadingView()
                    
                case .empty:
                    EmptyStateView(
                        title: "No Submissions",
                        systemImage: "tray",
                        description: "No submissions were found."
                    )
                    
                case .error(let message):
                    ErrorStateView(message: message)
                    
                case .loaded:
                    if viewModel.filteredSubmissions.isEmpty {
                        EmptyStateView(
                            title: "No Results",
                            systemImage: "magnifyingglass",
                            description: "Try a different search term."
                        )
                    } else {
                        List(viewModel.filteredSubmissions) { submission in
                            
                            NavigationLink {
                                SubmissionDetailView(
                                    submission: submission,
                                    isReviewed: viewModel.reviewedIDs.contains(submission.id)
                                )
                            } label: {
                                SubmissionRowView(
                                    submission: submission,
                                    isReviewed: viewModel.reviewedIDs.contains(submission.id)
                                )
                            }
                        }
                    }
                }
            }
            .navigationTitle("Client Intake")
            .searchable(text: $viewModel.searchText)
        }
        .task {
            viewModel.loadSubmissions()
        }
    }
}
