//
//  CategoryPresenter.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import UIKit

class CategoryPresenter: ViewToPresenterCategoryProtocol {
    var view: PresenterToViewCategoryProtocol?
    var interactor: PresenterToInteractorCategoryProtocol?
    var router: PresenterToRouterCategoryProtocol?
    func startNavigateToSource(navigationController: UINavigationController, category: String) {
        router?.navigateToSource(navigationController: navigationController, category: category)
    }
    
    
    
}

extension CategoryPresenter: InteractorToPresenterCategoryProtocol {
    func fetchCitiesByQueryFailed() {
        print("error!")
    }
    
    
}
