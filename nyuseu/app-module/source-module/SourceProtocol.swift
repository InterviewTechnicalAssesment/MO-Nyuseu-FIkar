//
//  SourceProtocol.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import UIKit

protocol ViewToPresenterSourceProtocol {
    var view: PresenterToViewSourceProtocol? {get set}
    var interactor: PresenterToInteractorSourceProtocol? {get set}
    var router: PresenterToRouterSourceProtocol? {get set}
    func startFetchingSourceByCategory(category: String)
    func startNavigateToArticle(navigationController: UINavigationController, source: Source)
}

protocol PresenterToViewSourceProtocol {
    func showSources(sources: [Source])
    func failShowSources()
}

protocol PresenterToRouterSourceProtocol {
    func navigateToArticle(navigationController: UINavigationController, source: Source)
    static func createSourceModule() -> SourceViewController
}

protocol PresenterToInteractorSourceProtocol {
    var presenter: InteractorToPresenterSourceProtocol? {get set}
    func fetchSourceByCategory(category: String)
}

protocol InteractorToPresenterSourceProtocol {
    func fetchSourceByCategorySuccess(source: SourceResponse)
    func fetchSourceByCategoryFailed()
}
