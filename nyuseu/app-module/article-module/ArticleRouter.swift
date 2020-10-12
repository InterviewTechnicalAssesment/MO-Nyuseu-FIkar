//
//  ArticleRouter.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import UIKit

class ArticleRouter: PresenterToRouterArticleProtocol {
    func navigateToWebviewArticle(navigationController: UINavigationController, url: String) {
        let WebviewModule = WebviewRouter.createWebviewModule()
        WebviewModule.url = url
        navigationController.pushViewController(WebviewModule, animated: true)
    }
    
    static func createArticleModule() -> ArticleViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
        var presenter: ViewToPresenterArticleProtocol & InteractorToPresenterArticleProtocol = ArticlePresenter()
        var interactor: PresenterToInteractorArticleProtocol = ArticleInteractor()
        let router: PresenterToRouterArticleProtocol = ArticleRouter()
        
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
