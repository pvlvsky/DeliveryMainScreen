//
//  ProductListModulBuilder.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 5.04.23.
//

import Foundation

class ProductListModulBuilder {
    static func buildModule() -> ProductListViewController {
        let interactor = ProductListInteractor()
        let router = ProductListRouter()
        let presenter = ProductListPresenter(router: router, interactor: interactor)
        let viewController = ProductListViewController(nibName: nil, bundle: nil)
        
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
}
