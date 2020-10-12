//
//  ArticleProtocol.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import UIKit

protocol ViewToPresenterArticleProtocol {
    var view: PresenterToViewArticleProtocol? {get set}
    var interactor: PresenterToInteractorArticleProtocol? {get set}
    var router: PresenterToRouterArticleProtocol? {get set}
    func startFetchingArticleBySource(source: Source, page: Int)
    func startNavigateToWebviewArticle(navigationController: UINavigationController, url: String)
}

protocol PresenterToViewArticleProtocol {
    func showArticles(articles: [Article])
}

protocol PresenterToRouterArticleProtocol {
    static func createArticleModule() -> ArticleViewController
    func navigateToWebviewArticle(navigationController: UINavigationController, url: String)
}

protocol PresenterToInteractorArticleProtocol {
    var presenter: InteractorToPresenterArticleProtocol? {get set}
    func fetchArticleBySource(source: Source, page: Int)
}

protocol InteractorToPresenterArticleProtocol {
    func fetchArticleBySourceSuccess(Article: ArticleResponse)
    func fetchArticleBySourceFailed()
}