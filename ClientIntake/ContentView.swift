//
//  ContentView.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import SwiftUI

import SwiftUI

struct ContentView: View {

    init() {
        do {
            let loader = SubmissionLoader()
            let submissions = try loader.load()

            print("Loaded \(submissions.count) submissions")
        } catch {
            print(error)
        }
    }

    var body: some View {
        Text("Client Intake")
    }
}

#Preview {
    ContentView()
}
