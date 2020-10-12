//
//  CategoryRouter.swift
//  nyuseu
//
//  Created by Muhammad Zulfikar on 12/10/20.
//

import Foundation
import UIKit

class CategoryRouter: PresenterToRouterCategoryProtocol {
    func navigateToSource(navigationController: UINavigationController, category: String) {
        let sourceModule = SourceRouter.createSourceModule()
        sourceModule.category = category
        navigationController.pushViewController(sourceModule, animated: true)
    }
    
    
    static func createCategoryModule() -> CategoryViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        var presenter: ViewToPresenterCategoryProtocol & InteractorToPresenterCategoryProtocol = CategoryPresenter()
        var interactor: PresenterToInteractorCategoryProtocol = CategoryInteractor()
        let router: PresenterToRouterCategoryProtocol = CategoryRouter()
        
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
