//
//  ArticleModel.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation

struct ArticleResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let title: String?
    let description: String?
    let author: String?
    let url: String?
    let urlToImage: String?
    let content: String?
}
