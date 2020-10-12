//
//  WebviewRouter.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 13/10/20.
//

import Foundation
import UIKit

class WebviewRouter: PresenterToRouterWebviewProtocol {
    
    static func createWebviewModule() -> WebviewArticleViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "WebviewArticleViewController") as! WebviewArticleViewController
        var presenter: ViewToPresenterWebviewProtocol & InteractorToPresenterWebviewProtocol = WebviewPresenter()
        var interactor: PresenterToInteractorWebviewProtocol = WebviewInteractor()
        let router: PresenterToRouterWebviewProtocol = WebviewRouter()
        
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
