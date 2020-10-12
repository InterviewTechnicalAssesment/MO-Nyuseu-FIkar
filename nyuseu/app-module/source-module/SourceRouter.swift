//
//  SourceRouter.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import UIKit

class SourceRouter: PresenterToRouterSourceProtocol {
    func navigateToArticle(navigationController: UINavigationController, source: Source) {
        let articleModule = ArticleRouter.createArticleModule()
        articleModule.source = source
        navigationController.pushViewController(articleModule, animated: true)
    }
    
    static func createSourceModule() -> SourceViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "SourceViewController") as! SourceViewController
        var presenter: ViewToPresenterSourceProtocol & InteractorToPresenterSourceProtocol = SourcePresenter()
        var interactor: PresenterToInteractorSourceProtocol = SourceInteractor()
        let router: PresenterToRouterSourceProtocol = SourceRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
