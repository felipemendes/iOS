//
//  ApiService.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 16/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    let baseUrl = "https://api.myjson.com"
    static let sharedInstance = ApiService()
    
    func fetchComingEvents(completion: @escaping ([Event]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/d0e00", completion: completion)
    }
    
    func fetchSpotlighEvents(completion: @escaping ([Event]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/dasd3", completion: completion)
    }
    
    func fetchTodayEvents(completion: @escaping ([Event]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/d0e00", completion: completion)
    }
    
    func fetchEventsByCategory(uuid: String, completion: @escaping ([Event]) -> ()) {
        print("\(baseUrl)/bins/mwrh4/\(uuid)")
        fetchFeed(forUrlString: "\(baseUrl)/bins/d0e00", completion: completion)
    }
    
    func fetchFeed(forUrlString urlString: String, completion: @escaping ([Event]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            do {
                if let unrappedData = data, let jsonDictionaries = try JSONSerialization.jsonObject(with: unrappedData, options: .mutableContainers) as? [[String: AnyObject]] {
                    DispatchQueue.main.async {
                        completion(jsonDictionaries.map({ return Event(dictionay: $0)} ))
                    }
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
    }
}
