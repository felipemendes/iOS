//
//  ApiService.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 16/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    func fetchEvents(completion: @escaping ([Event]) -> ()) {
        let url = URL(string: "https://api.myjson.com/bins/sik4m")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var events = [Event]()
                
                for dictionay in json as! [[String: AnyObject]] {
                    
                    let event = Event()
                    event.title = dictionay["title"] as? String
                    event.city = dictionay["city"] as? String
                    event.url_image = dictionay["url_image"] as? String
                    
                    let categoryDictionay = dictionay["category"] as! [String: AnyObject]
                    
                    let category = Category()
                    category.title = categoryDictionay["title"] as? String
                    category.category_image = categoryDictionay["category_image"] as? String
                    
                    event.category = category
                    
                    events.append(event)
                }
                
                DispatchQueue.main.async {
                    completion(events)
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }
}
