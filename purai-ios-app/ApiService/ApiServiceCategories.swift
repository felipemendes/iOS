//
//  ApiServiceCategories.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 17/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class ApiServiceCategory: ApiService {
    
    static let sharedCategoryInstance = ApiServiceCategory()
    func fetchCategories(completion: @escaping ([Category]) -> Void ) {
        fetchCategoryFeed(forUrlString: "\(baseUrl)/bins/19clcc", completion: completion)
    }
    
    func fetchCategoryFeed(forUrlString urlString: String, completion: @escaping ([Category]) -> Void) {
        guard let url = URL(string: urlString) else {
            print("No URL provided")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if error != nil {
                print(error ?? "No error message")
                return
            }
            
            do {
                if let unrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unrappedData, options: .mutableContainers) as? [[String: AnyObject]] {
                    DispatchQueue.main.async {
                        completion(jsonDictionaries.map({ return Category(dictionay: $0)}))
                    }
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
    }
}
