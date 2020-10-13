//
//  CategoryProtocol.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import UIKit

protocol ViewToPresenterCategoryProtocol {
    var view: PresenterToViewCategoryProtocol? {get set}
    var interactor: PresenterToInteractorCategoryProtocol? {get set}
    var router: PresenterToRouterCategoryProtocol? {get set}
    func startNavigateToSource(navigationController: UINavigationController, category: String)
}

protocol PresenterToViewCategoryProtocol {
    
}

protocol PresenterToRouterCategoryProtocol {
    func navigateToSource(navigationController: UINavigationController, category: String)
    static func createCategoryModule() -> CategoryViewController
}

protocol PresenterToInteractorCategoryProtocol {
    var presenter: InteractorToPresenterCategoryProtocol? {get set}
}

protocol InteractorToPresenterCategoryProtocol {
    
}

