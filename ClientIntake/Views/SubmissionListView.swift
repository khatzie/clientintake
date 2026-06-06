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
                    EmptyStateView()
                    
                case .error(let message):
                    ErrorStateView(message: message)
                    
                case .loaded:
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
                    .searchable(text: $viewModel.searchText)
                }
            }
            .navigationTitle("Client Intake")
        }
        .task {
            viewModel.loadSubmissions()
        }
    }
}
