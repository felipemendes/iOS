//
//  ApiServiceCategories.swift
//  iOS
//
//  Created by Felipe Mendes on 17/12/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class ApiServiceCategory: ApiService {
    
    static let sharedCategoryInstance = ApiServiceCategory()
    func fetchCategories(completion: @escaping ([Category]) -> Void ) {
        fetchCategoryFeed(forUrlString: "\(baseUrl)/bins/15ll5o", completion: completion)
    }
    
    func fetchCategoryFeed(forUrlString urlString: String, completion: @escaping ([Category]) -> Void) {
        guard let url = URL(string: urlString) else {
            print("No URL provided on fetchCategoryFeed()")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                print(error ?? "Fetch error. No error message")
                return
            }
            
            guard let data = data else { return }
            do {
                let categories = try JSONDecoder().decode([Category].self, from: data)
                DispatchQueue.main.async {
                    completion(categories)
                }
            } catch let jsonError {
                print("Error serializing json:", jsonError)
            }
        }.resume()
    }
}
