//
//  ProductListInteractor.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 4.04.23.
//

import Foundation

class ProductListInteractor {
    
    weak var presenter: ProductListPresenterProtocol?
    var networkService: NetworkServiceprotocol
    var cacheImageService: CacheImageDataServiceProtocol
    
    
    init(networkService: NetworkServiceprotocol = NetworkService(), cacheImageService: CacheImageDataServiceProtocol = CacheImageDataService()) {
        self.networkService = networkService
        self.cacheImageService = cacheImageService
    }
}

extension ProductListInteractor: ProductListInteractorProtocol {
    func loadFood() {
        networkService.loadFood { [weak self] result in
            guard let self = self else { return }
            self.presenter?.setFoods(entity: result)
        }
    }
}
