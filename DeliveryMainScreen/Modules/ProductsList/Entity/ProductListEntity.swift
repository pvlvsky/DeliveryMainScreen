//
//  ProductListEntity.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 5.04.23.
//

import Foundation

struct ProductListEntity: Codable {
    var food: [Food]
}

struct Food: Codable {
    var id: Int
    var title: String
    var description: String
    var category: String
    var price: Float
    var imageUrl: String
}
