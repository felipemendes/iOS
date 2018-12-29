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
    
    func fetchUpcomingEvents(completion: @escaping ([Event]) -> Void) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/d0e00", completion: completion)
    }
    
    func fetchSpotlighEvents(completion: @escaping ([Event]) -> Void) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/dasd3", completion: completion)
    }
    
    func fetchTodayEvents(completion: @escaping ([Event]) -> Void) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/14g3vc", completion: completion)
    }
    
    func fetchEventsByCategory(uuid: String, completion: @escaping ([Event]) -> ()) {
        print("\(baseUrl)/bins/14g3vc/\(uuid)")
        fetchFeed(forUrlString: "\(baseUrl)/bins/14g3vc", completion: completion)
    }
    
    func fetchFeed(forUrlString urlString: String, completion: @escaping ([Event]) -> Void) {
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
                        completion(jsonDictionaries.map({ return Event(dictionay: $0)}))
                    }
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
    }
}
