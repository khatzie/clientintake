//
//  ViewState.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/7/26.
//

import Foundation

enum ViewState {
    case loading
    case loaded
    case empty
    case offline
    case error(String)
}
