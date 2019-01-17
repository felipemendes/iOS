//
//  Event.swift
//  iOS
//
//  Created by Felipe Mendes on 04/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

@objcMembers
class Event: NSObject {
    
    var id: NSNumber?
    var guid: String?
    var slug: String?
    var status: String?
    var featured: String?
    var created_at: NSDate?
    var updated_at: NSDate?
    var title: String?
    var image: String?
    var about: String?
    var price: String?
    var date: String?
    var contact: String?
    var address: String?
    var city: String?
    var category: Category?
    var where_to_buy: WhereToBuy?
    
    var addressFormatted: String {
        if let city = city {
            return "\(address ?? localized("not_informed")) - \(city)"
        }
        return "\(address ?? localized("not_informed"))"
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "category" {
            self.category = Category()
            self.category?.setValuesForKeys(value as! [String: AnyObject])
            
        } else if key == "where_to_buy" {
            self.where_to_buy = WhereToBuy()
            self.where_to_buy?.setValuesForKeys(value as! [String: AnyObject])

        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    init(dictionay: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionay)
    }
}
