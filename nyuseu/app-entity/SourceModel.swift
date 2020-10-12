//
//  SourceModel.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation

struct SourceResponse: Codable {
    let status: String
    let sources: [Source]
}

struct Source: Codable {
    let id: String
    let name: String
    let category: String
}
