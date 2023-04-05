//
//  CacheImageDataService.swift
//  DeliveryMainScreen
//
//  Created by Ярослав Павловский on 5.04.23.
//

import UIKit

protocol CacheImageDataServiceProtocol: AnyObject {
    func getImage(with url: String, onComplete: @escaping (NSData?) -> ())
    func load(with url: URL, onComplete: @escaping (NSData?) -> ())
}

final class CacheImageDataService: CacheImageDataServiceProtocol {
        
    let cache = NSCache<NSString, NSData>()
    
    var responses = [URL: [(NSData?) -> ()]]()
        
    func getImage(with url: String, onComplete: @escaping (NSData?) -> ()) {
        let url = URL(string: url)
        guard let url = url else { return }
        if let data = cache.object(forKey: url.absoluteString as NSString) {
            onComplete(data)
        } else {
            load(with: url, onComplete: onComplete)
        }
    }
    
    func load(with url: URL, onComplete: @escaping (NSData?) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if self.responses[url] != nil {
                self.responses[url]?.append(onComplete)
            } else {
                self.responses[url] = [onComplete]
            }
            
            guard let data = data,
                  let blocks = self.responses[url] else {
                DispatchQueue.main.async {
                    onComplete(nil)
                }
                return
            }
            self.cache.setObject(data as NSData, forKey: url.absoluteString as NSString)
            for block in blocks {
                DispatchQueue.main.async {
                    block(data as NSData)
                }
            }
        }
        task.resume()
    }
}
