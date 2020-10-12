//
//  WebviewArticleProtocol.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 13/10/20.
//

import Foundation
import UIKit

protocol ViewToPresenterWebviewProtocol {
    var view: PresenterToViewWebviewProtocol? {get set}
    var interactor: PresenterToInteractorWebviewProtocol? {get set}
    var router: PresenterToRouterWebviewProtocol? {get set}
    func startLoadArticlePage(url: String)
}

protocol PresenterToViewWebviewProtocol {
    func showArticlePage(url: String)
}

protocol PresenterToInteractorWebviewProtocol {
    var presenter: InteractorToPresenterWebviewProtocol? {get set}
    
}

protocol PresenterToRouterWebviewProtocol {
    static func createWebviewModule() -> WebviewArticleViewController
}

protocol InteractorToPresenterWebviewProtocol {
    
}
