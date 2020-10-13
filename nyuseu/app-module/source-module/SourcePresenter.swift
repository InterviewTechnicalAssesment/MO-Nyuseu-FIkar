//
//  SourcePresenter.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import UIKit

class SourcePresenter: ViewToPresenterSourceProtocol {
    func startNavigateToArticle(navigationController: UINavigationController, source: Source) {
        router?.navigateToArticle(navigationController: navigationController, source: source)
    }
    
    var view: PresenterToViewSourceProtocol?
    
    var interactor: PresenterToInteractorSourceProtocol?
    
    var router: PresenterToRouterSourceProtocol?
    
    func startFetchingSourceByCategory(category: String) {
        interactor?.fetchSourceByCategory(category: category)
    }

}

//MARK: - INTERACTOR TO PRESENTER
extension SourcePresenter: InteractorToPresenterSourceProtocol {
    func fetchSourceByCategorySuccess(source: SourceResponse) {
        let sources: [Source] = source.sources
        view?.showSources(sources: sources)
    }
    
    func fetchSourceByCategoryFailed() {
        view?.failShowSources()
    }
    
    
}

