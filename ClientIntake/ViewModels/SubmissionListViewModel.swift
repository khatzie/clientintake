//
//  SubmissionListViewModel.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import Foundation
import Combine

@MainActor
final class SubmissionListViewModel: ObservableObject {
    
    @Published var submissions: [Submission] = []
    @Published var errorMessage: String?
    @Published var searchText = ""
    @Published private(set) var reviewedIDs: Set<String> = []
    @Published var state: ViewState = .loading
    
//    private let loader = SubmissionLoader()
    private let repository = SubmissionRepository()
    private let reviewedStore = ReviewedStore()
    
    var filteredSubmissions: [Submission] {
        guard !searchText.isEmpty else {
            return submissions
        }

        return submissions.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.email.localizedCaseInsensitiveContains(searchText) ||
            $0.service.localizedCaseInsensitiveContains(searchText) ||
            $0.status.displayName.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func loadSubmissions() {
        state = .loading
        
        Task{
            do {
//                let rawSubmissions = try loader.load()
//
//                submissions = rawSubmissions.map {
//                    Submission(raw: $0)
//                }

                submissions = try await repository.getSubmissions()

                reviewedIDs = reviewedStore.reviewedIDs()

                state = submissions.isEmpty ? .empty : .loaded

            } catch let error as URLError {
                
                switch error.code {
                case .notConnectedToInternet:
                    state = .offline
                default:
                    state = .error(error.localizedDescription)
                }
            }
            catch {
                errorMessage = error.localizedDescription
                state = .error(error.localizedDescription)
            }
        }
    }
    
    
    func markReviewed(_ submission: Submission) {
        reviewedStore.markReviewed(id: submission.id)
        reviewedIDs = reviewedStore.reviewedIDs()
    }
    
    func retry() {
        loadSubmissions()
    }
}
