//
//  Endpoint.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/10/26.
//

import Foundation

enum Endpoint {

    static let baseURL =
        "https://wwexam.free.beeceptor.com/api"

    static var submissions: URL {
        URL(
            string:
            "\(baseURL)/submissions"
        )!
    }
}
