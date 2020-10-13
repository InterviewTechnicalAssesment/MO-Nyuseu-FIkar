//
//  ArticlePresenter.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import UIKit

class ArticlePresenter: ViewToPresenterArticleProtocol {
    
    func startNavigateToWebviewArticle(navigationController: UINavigationController, url: String) {
        router?.navigateToWebviewArticle(navigationController: navigationController, url: url)
    }
    
    var view: PresenterToViewArticleProtocol?
    
    var interactor: PresenterToInteractorArticleProtocol?
    
    var router: PresenterToRouterArticleProtocol?
    
    func startFetchingArticleBySource(source: Source, query: String?, page: Int) {
        interactor?.fetchArticleBySource(source: source, query: query, page: page)
    }
    
    
}

extension ArticlePresenter: InteractorToPresenterArticleProtocol {
    func fetchArticleBySourceSuccess(Article: ArticleResponse) {
        let articles: [Article] = Article.articles
        view?.showArticles(articles: articles)
    }
    
    func fetchArticleBySourceFailed() {
        view?.failShowArticles()
    }
    
    
}
