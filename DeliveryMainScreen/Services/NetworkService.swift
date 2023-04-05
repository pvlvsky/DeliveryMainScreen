//
//  NetworkService.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 5.04.23.
//

import UIKit

protocol NetworkServiceprotocol {
    func loadFood(onComplete: @escaping (ProductListEntity) -> Void)
}


final class NetworkService: NetworkServiceprotocol {
    
    func loadFood(onComplete: @escaping (ProductListEntity) -> Void) {
        guard let url = URL(string: "https://my-json-server.typicode.com/pvlvsky/fakeServer/data") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let jsonData = data {
                print(jsonData)
                let food = try? JSONDecoder().decode(ProductListEntity.self, from: jsonData)
                
                DispatchQueue.main.async {
                    guard let food = food else { return }
                    onComplete(food)
                }
            }
        }.resume()
    }
}



