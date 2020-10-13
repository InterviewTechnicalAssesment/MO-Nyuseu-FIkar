//
//  SourceInteractor.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import Alamofire

class SourceInteractor: PresenterToInteractorSourceProtocol {
    var presenter: InteractorToPresenterSourceProtocol?
    
    func fetchSourceByCategory(category: String) {
        AF.request("\(NEWS_API_URL)sources?apiKey=\(NEWS_API_KEY)&category=\(category)").responseDecodable(of: SourceResponse.self) { (response) in
            if let sourceResponse = response.value {
                self.presenter?.fetchSourceByCategorySuccess(source: sourceResponse)
            } else {
                self.presenter?.fetchSourceByCategoryFailed()
            }
        }
    }
    
}
