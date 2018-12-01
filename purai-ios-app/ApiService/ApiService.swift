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
        fetchFeed(forUrlString: "\(baseUrl)/bins/sik4m", completion: completion)
    }
    
    func fetchSpotlighEvents(completion: @escaping ([Event]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/sik4m", completion: completion)
    }
    
    func fetchTodayEvents(completion: @escaping ([Event]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/sik4m", completion: completion)
    }
    
    func fetchCategoryEvents(completion: @escaping ([Event]) -> ()) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/sik4m", completion: completion)
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
                    
                    var events = [Event]()
                    for dictionay in jsonDictionaries {
                        let event = Event(dictionay: dictionay)
                        events.append(event)
                    }
                    
                    DispatchQueue.main.async {
                        completion(events)
                    }
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
    }
}
