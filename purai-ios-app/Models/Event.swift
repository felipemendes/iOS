//
//  Event.swift
//  purai-ios-app
//
//  Created by Felipe Mendes on 04/11/18.
//  Copyright © 2018 Felipe Mendes. All rights reserved.
//

import UIKit

@objcMembers
class Event: NSObject {
    
    var id: NSNumber?
    var uuid: String?
    var status: NSNumber?
    var featured: NSNumber?
    var created_at: NSDate?
    var updated_at: NSDate?
    var title: String?
    var image: String?
    var about: String?
    var price: String?
    var date: NSDate?
    var address: String?
    var city: String?
    var id_category: NSNumber?
    var id_sale_place: NSNumber?
    var sale_place: SalePlace?
    var category: Category?
    
    var addressFormatted: String {
        return address! + " - " + city!
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "category" {
            self.category = Category()
            self.category?.setValuesForKeys(value as! [String: AnyObject])
            
        } else if key == "sale_place" {
            self.sale_place = SalePlace()
            self.sale_place?.setValuesForKeys(value as! [String: AnyObject])

        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    init(dictionay: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionay)
    }
}
