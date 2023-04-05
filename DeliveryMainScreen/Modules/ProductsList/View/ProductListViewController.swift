//
//  ProductListViewController.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 4.04.23.
//

import UIKit

class ProductListViewController: UIViewController {
    
    var presenter: ProductListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
        
    }
}

extension ProductListViewController: ProductListViewControllerProtocol {
    
}
