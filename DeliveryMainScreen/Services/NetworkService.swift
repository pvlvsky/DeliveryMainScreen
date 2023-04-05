//
//  NetworkService.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 5.04.23.
//

import UIKit

enum APIError: Error {
    case invalidURL
    case taskError
    case invalidResponse
    case invalidStatusCode(Int)
    case noData
    case invalidJSON
}

final class NetworkService {
    
    enum RequestType {
        case loadFood
        case loadImage(urlToLoad: String)
    }
    
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        return URLSession(configuration: configuration)
    }()
    
    private let requestType: RequestType
    
//    private var path: String {
//        switch requestType {
//        case .loadFood:
//            return "https://my-json-server.typicode.com/pvlvsky/fakeServer/data"
//        case let .loadImage(urlToLoad):
//            return urlToLoad
//        }
//    }
    
    init(requestType: RequestType) {
        self.requestType = requestType
    }
    
    func loadFood(onComplete: @escaping (Result<ProductListEntity, APIError>) -> Void) {
        guard let url = URL(string: "https://my-json-server.typicode.com/pvlvsky/fakeServer/data") else {
            return onComplete(.failure(.invalidURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                onComplete(.failure(.taskError))
            }
            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.invalidResponse))
            }
            if response.statusCode != 200 {
                onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }
            guard let data = data else {
                return onComplete(.failure(.noData))
            }
            do {
                let list = try JSONDecoder().decode(ProductListEntity.self, from: data)
                onComplete(.success(list))
            } catch {
                onComplete(.failure(.invalidJSON))
            }
        }
        task.resume()
    }
}
//    func loadImage(onComplete: @escaping (Result<Data, APIError>, String) -> Void) {
//        guard let url = URL(string: path) else {
//            return onComplete(.failure(.invalidURL), "ERROR")
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        let task = session.dataTask(with: request) { (data, response, error) in
//            if let _ = error {
//                onComplete(.failure(.taskError), "ERROR")
//            }
//            guard let response = response as? HTTPURLResponse else {
//                return onComplete(.failure(.invalidResponse), "ERROR")
//            }
//            if response.statusCode != 200 {
//                onComplete(.failure(.invalidStatusCode(response.statusCode)), "ERROR")
//            }
//            guard let data = data else {
//                return onComplete(.failure(.noData), "ERROR")
//            }
//            do {
//                let imageData = try JSONDecoder().decode(Data.self, from: data)
//                let imageUrl = url.absoluteString
//                onComplete(.success(imageData), imageUrl)
//            } catch {
//                onComplete(.failure(.invalidJSON), "ERROR")
//            }
//        }
//        task.resume()
//    }
//}


