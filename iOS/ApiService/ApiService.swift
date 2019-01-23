//
//  ApiService.swift
//  iOS
//
//  Created by Felipe Mendes on 16/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    let baseUrl = "https://api.myjson.com"
    static let sharedInstance = ApiService()
    
    func fetchUpcomingEvents(completion: @escaping ([Event]) -> Void) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/1ey3cs", completion: completion)
    }
        
    func fetchSpotlighEvents(completion: @escaping ([Event]) -> Void) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/12fzng", completion: completion)
    }
    
    func fetchTodayEvents(completion: @escaping ([Event]) -> Void) {
        fetchFeed(forUrlString: "\(baseUrl)/bins/12fzng", completion: completion)
    }
    
    func fetchEventsByCategory(slug: String, completion: @escaping ([Event]) -> Void) {
        print("\(baseUrl)/bins/14g3vc/\(slug)")
        fetchFeed(forUrlString: "\(baseUrl)/bins/1ey3cs", completion: completion)
    }
    
    func fetchFeed(forUrlString urlString: String, completion: @escaping ([Event]) -> Void) {
        guard let url = URL(string: urlString) else {
            print("No URL provided on fetchFeed()")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                print(error ?? "Fetch error. No error message")
                return
            }
            
            guard let data = data else { return }
            do {
                let events = try JSONDecoder().decode([Event].self, from: data)
                DispatchQueue.main.async {
                    completion(events)
                }
            } catch let jsonError {
                print("Error serializing json:", jsonError)
            }
        }.resume()
    }
}
