//
//  String+Extension.swift
//  ClientIntake
//
//  Created by Katherine Petalio on 6/6/26.
//

import Foundation

extension String {
    var nonEmpty: String? {
        isEmpty ? nil : self
    }
}
