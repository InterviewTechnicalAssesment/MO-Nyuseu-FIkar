//
//  ArticleInteractor.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import Alamofire

class ArticleInteractor: PresenterToInteractorArticleProtocol {
    var presenter: InteractorToPresenterArticleProtocol?
    
    func fetchArticleBySource(source: Source, page: Int) {
        AF.request("\(NEWS_API_URL)/everything?sources=\(source.id)&apiKey=\(NEWS_API_KEY)&pageSize=10&page=\(page)").responseDecodable(of: ArticleResponse.self) { (response) in
            if let articleResponse = response.value {
                self.presenter?.fetchArticleBySourceSuccess(Article: articleResponse)
            } else {
                print("error", response)
                self.presenter?.fetchArticleBySourceFailed()
            }
        }
    }
    
    
}
