//
//  ProductListPresenter.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 4.04.23.
//

import Foundation

class ProductListPresenter {
    weak var view: ProductListViewControllerProtocol?
    var router: ProductListRouterProtocol
    var interactor: ProductListInteractorProtocol
    
    init(router: ProductListRouterProtocol, interactor: ProductListInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension ProductListPresenter: ProductListPresenterProtocol {
    func viewDidLoaded() {
        //Start loading info
    }
}
