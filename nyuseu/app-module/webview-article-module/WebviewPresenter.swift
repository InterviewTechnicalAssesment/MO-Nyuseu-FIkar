//
//  WebviewPresenter.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 13/10/20.
//

import Foundation
import UIKit

class WebviewPresenter: ViewToPresenterWebviewProtocol {
    
    var view: PresenterToViewWebviewProtocol?
    
    var interactor: PresenterToInteractorWebviewProtocol?
    
    var router: PresenterToRouterWebviewProtocol?
    
    func startLoadArticlePage(url: String) {
        view?.showArticlePage(url: url)
    }
    
    
}

extension WebviewPresenter: InteractorToPresenterWebviewProtocol {
    
}
